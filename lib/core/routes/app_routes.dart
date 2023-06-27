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
import 'package:chatapp/presentation/home/pages/home_page.dart';
import 'package:chatapp/presentation/media/pages/media_page.dart';
import 'package:chatapp/presentation/others/loading_page.dart';
import 'package:chatapp/presentation/map/pages/map_page.dart';
import 'package:chatapp/presentation/setting/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';

import 'route_name.dart';

class AppRoutes {
  static final routeObserver = RouteObserver<PageRoute>();

  static Map<String, WidgetBuilder> routes = {};

  static Route unAuthorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginPage:
        return _buildRoute(
          settings,
          const LoginPage(),
        );
      case RouteName.signUpPage:
        return _buildRoute(
          settings,
          const RegisterPage(),
        );
      case RouteName.forgotPassword:
        return _buildRoute(settings, const ForgotPasswordPage());
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
        return _buildRoute(
          settings,
          const HomePage(),
        );
      case RouteName.editProfile:
        return _buildRoute(
          settings,
          const EditProfilePage(),
        );
      case RouteName.friendInfo:
        return _buildRoute(
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
          return _buildRoute(
            settings,
            ChatRoomPage(
              id: id,
              type: type,
              chatRoomId: chatRoomId,
            ),
          );
        }
      case RouteName.personalChatRoom:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final chatRoomId = args["chatRoomId"] as String;
          final friendId = args["friendId"] as String;
          return _buildRoute(
              settings,
              FriendDetailPage(
                chatRoomId: chatRoomId,
                friendId: friendId,
              ));
        }
      case RouteName.groupChatRoom:
        {
          return _buildRoute(
              settings, GroupDetailPage(groupId: settings.arguments as String));
        }

      case RouteName.deviceAdministration:
        return _buildRoute(settings, const DeviceMainPage());
      case RouteName.createGroup:
        return _buildRoute(settings, const CreateGroupPage());
      case RouteName.editGroup:
        {
          final args = settings.arguments as Map<String, dynamic>;
          final groupId = args["groupId"] as String;
          final groupName = args["groupName"] as String;
          final groupAvatar = args["groupAvatar"] as String;
          return _buildRoute(
            settings,
            EditGroupPage(
              groupId: groupId,
              groupAvatar: groupAvatar,
              groupName: groupName,
            ),
          );
        }

      case RouteName.googleMap:
        return _buildRoute(settings, const MapPage());
      case RouteName.medias:
        {
          return _buildRoute(
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
