import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/search/search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../domain/entities/chat_room_entity.dart';
import '../../../domain/entities/user_entity.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@Injectable()
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase;

  SearchBloc(this._searchUseCase) : super(const _Initial()) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        inputChanged: (event) async => await _inputChanged(event, emit),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }

  _started(_Started event, Emitter<SearchState> emit) {}

  Future<void> _inputChanged(
      SearchInputChanged event, Emitter<SearchState> emit) async {
    try {
      final res = await _searchUseCase.searchGlobally(event.query);
      if (res != null) {
        emit(state.copyWith(
          friends: res.friends,
          groups: res.groups,
          messages: res.messages,
        ));
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  EventTransformer<E> debounce<E>(Duration duration) {
    return (events, mapper) {
      return events.debounce(duration).switchMap(mapper);
    };
  }
}
