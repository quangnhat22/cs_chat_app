import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'group_details_event.dart';
part 'group_details_state.dart';
part 'group_details_bloc.freezed.dart';

@Injectable()
class GroupDetailsBloc extends Bloc<GroupDetailsEvent, GroupDetailsState> {
  GroupDetailsBloc(this._chatRoomUseCase, this._groupUseCase)
      : super(const _Initial()) {
    on<GroupDetailsEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        leaved: (event) => _leaved(event, emit),
        refreshed: (event) => _refresh(event, emit),
      );
    });
  }

  final ChatRoomUseCase _chatRoomUseCase;
  final GroupUseCase _groupUseCase;

  Future<void> _started(_Started event, Emitter<GroupDetailsState> emit) async {
    try {
      emit(const GetGroupDetailsInProgress());
      final groupDetails =
          await _chatRoomUseCase.getChatRoomDetailById(event.id);
      emit(GetGroupDetailsInSuccess(groupInfo: groupDetails));
    } catch (e) {
      emit(GetGroupDetailsInFailed(message: e.toString()));
    }
  }

  Future<void> _refresh(
      GroupDetailsRefreshed event, Emitter<GroupDetailsState> emit) async {
    try {
      if (state is GetGroupDetailsInSuccess) {
        final chatRoomInfoId = (state as GetGroupDetailsInSuccess).groupInfo.id;
        final groupDetails =
            await _chatRoomUseCase.getChatRoomDetailById(chatRoomInfoId);
        emit(GetGroupDetailsInSuccess(groupInfo: groupDetails));
      }
    } catch (e) {
      emit(GetGroupDetailsInFailed(message: e.toString()));
    }
  }

  Future<void> _leaved(
      GroupDetailsLeaved event, Emitter<GroupDetailsState> emit) async {
    try {
      final isSentSuccess = await _groupUseCase.leaveGroup(event.id);
      if (isSentSuccess) {
        emit(const LeaveGroupDetailsInSuccess());
      } else {
        emit(const LeaveGroupDetailsInFailed());
      }
    } catch (e) {
      emit(const LeaveGroupDetailsInFailed());
    }
  }
}
