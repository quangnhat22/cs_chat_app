import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/domain/entities/chat_room_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'friend_detail_state.dart';
part 'friend_detail_cubit.freezed.dart';

@Injectable()
class FriendDetailCubit extends Cubit<FriendDetailState> {
  FriendDetailCubit(this._useCase, this._userUseCase)
      : super(const FriendDetailState.initial());

  final ChatRoomUseCase _useCase;
  final UserUseCase _userUseCase;

  Future<void> getGroupDetails(
      {required String id, required String chatRoomId}) async {
    try {
      final chatRoomInfo = await _useCase.getChatRoomDetailById(chatRoomId);

      emit(state.copyWith(
        chatRoomDetail: chatRoomInfo,
        id: id,
        chatRoomId: chatRoomId,
      ));
    } catch (e) {
      ///TODO: exception
      throw Exception();
    }
  }

  Future<void> tappedFriendCard() async {
    try {
      if (state.id == null) return;
      final friendsInfo = await _userUseCase.getUserById(state.id!);
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
