import 'dart:developer';

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
  SearchBloc() : super(const _Initial()) {
    on<SearchEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        inputChanged: (event) => _listRequestRefreshed(event, emit),
      );
    }, transformer: debounce(const Duration(milliseconds: 10000)));
  }

  _started(_Started event, Emitter<SearchState> emit) {}

  _listRequestRefreshed(SearchInputChanged event, Emitter<SearchState> emit) {
    log(event.query.toString());
  }

  EventTransformer<E> debounce<E>(Duration duration) {
    return (events, mapper) {
      return events.debounce(duration).switchMap(mapper);
    };
  }
}
