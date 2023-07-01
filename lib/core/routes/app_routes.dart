import 'package:chatapp/core/routes/app_transition_animation.dart';
import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/presentation/auth/fogot_password/forgot_password.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/auth/register/register.dart';
import 'package:chatapp/presentation/chat/chat_room/pages/chat_room_page.dart';
import 'package:chatapp/presentation/device/device_administration.dart';
import 'package:chatapp/presentation/friends/find_new_friend/find_new_friend.dart';
import 'package:chatapp/presentation/friends/friends_detail/pages/friends_detail_page.dart';
import 'package:chatapp/presentation/friends/friends_infor/friends_infor.dart';
import 'package:chatapp/presentation/group/create_group/create_group.dart';
import 'package:chatapp/presentation/group/edit_group/pages/edit_group_page.dart';
import 'package:chatapp/presentation/group/group_details/pages/group_details_page.dart';
import 'package:chatapp/presentation/group/invite_member_group/pages/invite_new_member_page.dart';
import 'package:chatapp/presentation/group/list_member_group/pages/list_member_group_page.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
import 'package:chatapp/presentation/media/pages/media_page.dart';
import 'package:chatapp/presentation/others/loading_page.dart';
import 'package:chatapp/presentation/map/pages/map_page.dart';
import 'package:chatapp/presentation/setting/edit_profile/edit_profile.dart';
import 'package:chatapp/presentation/setting/update_password/pages/update_password_page.dart';
import 'package:flutter/material.dart';

import 'route_name.dart';

class AppRoutes {
  static final routeObserver = RouteObserver<PageRoute>();

  static Map<String, WidgetBuilder> routes = {};

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginPage:
        return _buildAnimationRoute(
          settings,
          const LoginPage(),
        );
      case RouteName.signUpPage:
        return _buildAnimationRoute(
          settings,
          const RegisterPage(),
        );
      case RouteName.forgotPassword:
        return _buildAnimationRoute(settings, const ForgotPasswordPage());
      default:
        return _errorRoute();
    }
  }

  static Route loadingRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _buildRoute(
          settings,
          const LoadingPage(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return _buildAnimationRoute(
          settings,
          const HomePage(),
        );
      case RouteName.editProfile:
        return _buildAnimationRoute(
          settings,
          const EditProfilePage(),
        );
      case RouteName.friendInfo:
        return _buildAnimationRoute(
          settings,
          FriendsInforPage(
            userInfo: settings.arguments as UserEntity,
          ),
        );
      case RouteName.findFriend:
        return _buildRouteDialog(
          settings,
          const FindNewFriendPage(),
        );
      case RouteName.chatRoom:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final id = args["id"] as String;
          final chatRoomId = args["chatRoomId"] as String;
          final type = args["type"] as String;
          final searchMessageId = args["search_message"] as MessageEntity?;
          return _buildAnimationRoute(
            settings,
            ChatRoomPage(
              id: id,
              type: type,
              chatRoomId: chatRoomId,
              messageSearch: searchMessageId,
            ),
          );
        }
      case RouteName.personalChatRoom:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final chatRoomId = args["chatRoomId"] as String;
          final friendId = args["friendId"] as String;
          return _buildAnimationRoute(
              settings,
              FriendDetailPage(
                chatRoomId: chatRoomId,
                friendId: friendId,
              ));
        }
      case RouteName.groupChatRoom:
        {
          return _buildAnimationRoute(
              settings, GroupDetailPage(groupId: settings.arguments as String));
        }
      // return _buildRoute(
      //   settings,
      //   ChatRoomPage(
      //     id: settings.arguments as String,
      //     type: "group",
      //   ),
      // );
      case RouteName.updatePassword:
        return _buildRoute(settings, const UpdatePasswordPage());

      case RouteName.deviceAdministration:
        return _buildAnimationRoute(settings, const DeviceMainPage());
      case RouteName.createGroup:
        return _buildAnimationRoute(settings, const CreateGroupPage());
      case RouteName.editGroup:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final groupId = args["groupId"] as String;
          final groupName = args["groupName"] as String?;
          final groupAvatar = args["groupAvatar"] as String?;
          return _buildAnimationRoute(
            settings,
            EditGroupPage(
              groupId: groupId,
              groupAvatar: groupAvatar,
              groupName: groupName,
            ),
          );
        }
      case RouteName.listMemberGroup:
        {
          return _buildAnimationRoute(
            settings,
            ListMemberGroupPage(
                listMember: settings.arguments as List<UserEntity>),
          );
        }
      case RouteName.inviteNewMemberGroup:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final groupId = args["groupId"] as String;
          final listMember = args["member"] as List<UserEntity>;
          return _buildAnimationRoute(
            settings,
            InviteNewMemberPage(
              listMember: listMember,
              chatRoomId: groupId,
            ),
          );
        }
      case RouteName.googleMap:
        return _buildRoute(settings, const MapPage());
      case RouteName.medias:
        {
          return _buildAnimationRoute(
            settings,
            MediaPage(chatRoomId: settings.arguments as String),
          );
        }
      default:
        return _errorRoute();
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(
      RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }

  static SlideRightRoute _buildAnimationRoute(
      RouteSettings settings, Widget builder) {
    return SlideRightRoute(
      page: builder,
    );
  }

  static Route _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Coming soon'),
        ),
        body: const Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
