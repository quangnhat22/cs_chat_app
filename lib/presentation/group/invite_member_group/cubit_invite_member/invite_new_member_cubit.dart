import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'invite_new_member_state.dart';
part 'invite_new_member_cubit.freezed.dart';

@Injectable()
class InviteNewMemberCubit extends Cubit<InviteNewMemberState> {
  final GroupUseCase _groupUseCase;
  final FriendUseCase _friendUseCase;

  InviteNewMemberCubit(
    this._groupUseCase,
    this._friendUseCase,
  ) : super(const InviteNewMemberState.initial());

  Future<void> pageStarted(List<UserEntity> members, String chatRoomId) async {
    try {
      emit(state.copyWith(getFriendsStatus: GetFriendsStatus.inProgress));
      final listFriends = await _friendUseCase.getListFriend();
      final displayMember = listFriends
          .where((friend) => !_isMemberExist(members, friend))
          .toList();

      emit(state.copyWith(
          listMembers: displayMember,
          displayMembers: displayMember,
          chatRoomId: chatRoomId,
          getFriendsStatus: GetFriendsStatus.success));
    } catch (e) {
      emit(state.copyWith(getFriendsStatus: GetFriendsStatus.fail));
      throw Exception(e.toString());
    }
  }

  void inputChanged(String value) {
    List<UserEntity>? displayMember = state.listMembers;
    if (value.trim() != '') {
      displayMember = state.listMembers
          ?.where((member) =>
              (member.name != null &&
                  member.name!.toLowerCase().contains(value.toLowerCase())) ||
              (member.email != null &&
                  member.email!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    }
    emit(state.copyWith(displayMembers: displayMember));
  }

  Future<void> inviteNewMemberSubmitted(List<UserEntity> members) async {
    try {
      if (state.chatRoomId == null) return;
      emit(state.copyWith(status: InviteNewMemberStatus.inProgress));
      final membersId = members.map((user) => user.id).toList();
      final isSuccess = await _groupUseCase.inviteNewMember(
          groupId: state.chatRoomId!, membersId: membersId);
      if (isSuccess) {
        SnackBarApp.showSnackBar(
            null, "Invite new member success", TypesSnackBar.success);
        emit(state.copyWith(status: InviteNewMemberStatus.success));
      } else {
        SnackBarApp.showSnackBar(
            null, "Invite new member fail", TypesSnackBar.error);
      }
    } catch (e) {
      SnackBarApp.showSnackBar(
          null, "Invalid request! Please check.", TypesSnackBar.error);
      emit(state.copyWith(status: InviteNewMemberStatus.fail));
      throw Exception(e.toString());
    }
  }

  bool _isMemberExist(List<UserEntity> members, UserEntity friend) {
    final isExist =
        members.firstWhereOrNull((member) => member.id == friend.id);
    return isExist != null;
  }
}
