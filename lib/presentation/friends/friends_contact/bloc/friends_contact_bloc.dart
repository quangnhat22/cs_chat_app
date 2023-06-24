import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';
import '../../../../domain/entities/chat_room_entity.dart';

part 'friends_contact_bloc.freezed.dart';
part 'friends_contact_event.dart';
part 'friends_contact_state.dart';

@Injectable()
class FriendsContactBloc
    extends Bloc<FriendsContactEvent, FriendsContactState> {
  FriendsContactBloc(this._chatRoomUseCase, this._userUseCase)
      : super(const _Initial()) {
    on<FriendsContactEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        tappedFriendCard: (event) => _tappedFriendCard(event, emit),
      );
    });
  }

  final ChatRoomUseCase _chatRoomUseCase;
  final UserUseCase _userUseCase;

  Future<void> _started(
      _Started event, Emitter<FriendsContactState> emit) async {
    try {
      emit(const FriendsContactLoading());
      final friends = await _chatRoomUseCase.getListChatRoom("personal");
      emit(FriendsContactSuccess(friends: friends));
    } catch (e) {
      emit(FriendsContactFailure(message: e.toString()));
    }
  }

  Future<void> _tappedFriendCard(
      TapFriendContactCard event, Emitter<FriendsContactState> emit) async {
    try {
      final friendsInfo = await _userUseCase.getUserById(event.id);
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
