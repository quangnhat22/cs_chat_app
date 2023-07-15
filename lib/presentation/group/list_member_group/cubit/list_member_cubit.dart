import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'list_member_state.dart';
part 'list_member_cubit.freezed.dart';

@Injectable()
class ListMemberCubit extends Cubit<ListMemberState> {
  final UserUseCase _useCase;

  ListMemberCubit(this._useCase) : super(const ListMemberState.initial());

  void pageStarted(List<UserEntity> members) {
    emit(state.copyWith(listMember: members, listMemberDisplay: members));
  }

  void searchInputChanged(String value) {
    List<UserEntity>? displayMember = state.listMember;
    if (value.trim() != '') {
      displayMember = state.listMember
          ?.where((member) =>
              (member.name != null &&
                  member.name!.toLowerCase().contains(value.toLowerCase())) ||
              (member.email != null &&
                  member.email!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    }
    emit(state.copyWith(listMemberDisplay: displayMember));
  }

  void tapMemberGroup(String userId) async {
    try {
      final friendsInfo = await _useCase.getUserById(userId);
      if (friendsInfo != null) {
        //redirect friend info page
        NavigationUtil.pushNamed(
            route: RouteName.friendInfo, args: friendsInfo);
      } else {
        return;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
