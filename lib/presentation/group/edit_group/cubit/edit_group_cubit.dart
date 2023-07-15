import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'edit_group_state.dart';
part 'edit_group_cubit.freezed.dart';

@Injectable()
class EditGroupCubit extends Cubit<EditGroupState> {
  EditGroupCubit(this._groupUC) : super(const EditGroupState.initial());

  final GroupUseCase _groupUC;

  void started(String groupId, String? groupName, String? groupAvatar) {
    emit(state.copyWith(
        groupId: groupId, groupName: groupName, groupAvatar: groupAvatar));
  }

  void groupImageChanged(String? groupImage) {
    emit(state.copyWith(
      groupAvatar: groupImage,
      isChangeImage: true,
    ));
  }

  void groupNameChanged(String? groupName) {
    emit(state.copyWith(groupName: groupName));
  }

  Future<void> updateGroup() async {
    try {
      emit(state.copyWith(status: EditGroupSubmitStatus.inProgress));
      if (state.groupId != null &&
          state.groupName != null &&
          state.groupName!.trim().isNotEmpty) {
        final isSuccess = await _groupUC.updateGroup(
            groupId: state.groupId!,
            groupName: state.groupName,
            groupAvatar: state.groupAvatar);
        if (isSuccess) {
          emit(state.copyWith(status: EditGroupSubmitStatus.success));
          return;
        }
      }
      emit(state.copyWith(status: EditGroupSubmitStatus.fail));
    } catch (e) {
      emit(state.copyWith(status: EditGroupSubmitStatus.fail));
      throw Exception(e.toString());
    }
  }
}
