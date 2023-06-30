import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/chat_room_entity.dart';

part 'list_group_bloc.freezed.dart';
part 'list_group_event.dart';
part 'list_group_state.dart';

@Injectable()
class ListGroupBloc extends Bloc<ListGroupEvent, ListGroupState> {
  ListGroupBloc(this._chatRoomUC) : super(const _Initial()) {
    on<ListGroupEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  final ChatRoomUseCase _chatRoomUC;

  Future<void> _started(_Started event, Emitter<ListGroupState> emit) async {
    try {
      emit(const GetListGroupInProgress());
      final listGroup = await _chatRoomUC.getListChatRoom("group");
      emit(GetListGroupInSuccess(listGroup: listGroup));
    } catch (e) {
      emit(GetListGroupInFailed(message: e.toString()));
    }
  }

  Future<void> _refresh(
      ListGroupRefreshed event, Emitter<ListGroupState> emit) async {
    try {
      final listGroup = await _chatRoomUC.getListChatRoom("group");
      emit(GetListGroupInSuccess(listGroup: listGroup));
    } catch (e) {
      emit(GetListGroupInFailed(message: e.toString()));
    }
  }
}
