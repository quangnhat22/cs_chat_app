import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/routes/app_navigation.dart';
import '../../../../core/routes/route_name.dart';

part 'friends_contact_bloc.freezed.dart';
part 'friends_contact_event.dart';
part 'friends_contact_state.dart';

@Injectable()
class FriendsContactBloc
    extends Bloc<FriendsContactEvent, FriendsContactState> {
  FriendsContactBloc(
      {required FriendUseCase useCase, required UserUseCase userUseCase})
      : _useCase = useCase,
        _userUseCase = userUseCase,
        super(const _Initial()) {
    on<FriendsContactEvent>((event, emit) async {
      await event.map(
        started: (event) => _started(event, emit),
        tappedFriendCard: (event) => _tappedFriendCard(event, emit),
      );
    });
  }

  final FriendUseCase _useCase;
  final UserUseCase _userUseCase;

  Future<void> _started(
      _Started event, Emitter<FriendsContactState> emit) async {
    try {
      emit(const FriendsContactLoading());
      final friends = await _useCase.getListFriend();
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