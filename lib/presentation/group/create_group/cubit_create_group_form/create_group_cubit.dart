import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_group_state.dart';
part 'create_group_cubit.freezed.dart';

@Injectable()
class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit() : super(const CreateGroupState.initial());

  void groupNameChanged(String groupName) {
    emit(state.copyWith(groupName: groupName));
  }

  void groupImageChanged(String? groupImage) {
    emit(state.copyWith(groupImage: groupImage));
  }

  void groupMembersChanged(UserEntity member) {
    final existingMember = state.members
        .firstWhere((item) => item?.id == member.id, orElse: () => null);

    final updatedMembers = [...state.members];

    if (existingMember == null) {
      updatedMembers.add(member);
    } else {
      updatedMembers.removeWhere((element) => element?.id == member.id);
    }

    emit(state.copyWith(members: updatedMembers));
  }
}
