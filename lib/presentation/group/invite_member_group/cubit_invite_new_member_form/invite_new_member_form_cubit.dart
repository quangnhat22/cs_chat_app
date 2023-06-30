import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'invite_new_member_form_state.dart';
part 'invite_new_member_form_cubit.freezed.dart';

@Injectable()
class InviteNewMemberFormCubit extends Cubit<InviteNewMemberFormState> {
  InviteNewMemberFormCubit() : super(const InviteNewMemberFormState.initial());

  void groupMembersChanged(UserEntity member) {
    final existingMember = state.newMember.firstWhere(
      (item) => item.id == member.id,
      orElse: () => UserEntity.userEntityEmpty,
    );

    final updatedMembers = [...state.newMember];

    if (existingMember == UserEntity.userEntityEmpty) {
      updatedMembers.add(member);
    } else {
      updatedMembers.removeWhere((element) => element.id == member.id);
    }

    emit(state.copyWith(newMember: updatedMembers));
  }
}
