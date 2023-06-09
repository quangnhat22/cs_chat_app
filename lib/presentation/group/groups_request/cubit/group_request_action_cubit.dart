import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'group_request_action_cubit.freezed.dart';
part 'group_request_action_state.dart';

@Injectable()
class GroupRequestActionCubit extends Cubit<GroupRequestActionState> {
  GroupRequestActionCubit({required GroupUseCase groupUC})
      : _groupUC = groupUC,
        super(const GroupRequestActionState.initial());

  final GroupUseCase _groupUC;

  Future<void> recallRequest(String groupId, String friendId) async {
    try {
      emit(const GroupActionLoading());
      final isSuccess = await _groupUC.recallGroupRequest(groupId, friendId);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(message: 'Something wrong!, try again'));
      }
    } catch (e) {
      emit(GroupRequestActionState.failure(message: e.toString()));
    }
  }

  Future<void> acceptRequest(String groupId) async {
    try {
      emit(const GroupActionLoading());
      final isSuccess = await _groupUC.acceptRequestt(groupId);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(message: 'Something wrong!, try again'));
      }
    } catch (e) {
      emit(GroupRequestActionState.failure(message: e.toString()));
    }
  }

  Future<void> rejectRequest(String id) async {
    try {
      emit(const GroupActionLoading());
      final isSuccess = await _groupUC.rejectRequest(id);
      if (isSuccess) {
        emit(const GroupActionSuccess());
      } else {
        emit(const GroupActionFailure(message: 'Something wrong! Try again'));
      }
    } catch (e) {
      emit(GroupActionFailure(message: e.toString()));
    }
  }
}
