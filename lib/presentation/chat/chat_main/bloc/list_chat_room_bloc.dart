import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/chat_room_entity.dart';

part 'list_chat_room_event.dart';
part 'list_chat_room_state.dart';
part 'list_chat_room_bloc.freezed.dart';

@Injectable()
class ListChatRoomBloc extends Bloc<ListChatRoomEvent, ListChatRoomState> {
  final ChatRoomUseCase _chatRoomUseCase;

  ListChatRoomBloc(this._chatRoomUseCase) : super(const _Initial()) {
    on<ListChatRoomEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  Future<void> _started(_Started event, Emitter<ListChatRoomState> emit) async {
    try {
      emit(const GetListChatRoomInProgress());
      final listChatRoom = await _chatRoomUseCase.getListChatRoom(null);
      emit(GetListChatRoomInSucess(listChatRoom: listChatRoom));
    } catch (e) {
      emit(GetListChatRoomInFailure(message: e.toString()));
    }
  }

  Future<void> _refresh(
      ListChatRoomRefreshed event, Emitter<ListChatRoomState> emit) async {
    try {
      final listChatRoom = await _chatRoomUseCase.getListChatRoom(null);
      emit(GetListChatRoomInSucess(listChatRoom: listChatRoom));
    } catch (e) {
      emit(GetListChatRoomInFailure(message: e.toString()));
    }
  }
}
