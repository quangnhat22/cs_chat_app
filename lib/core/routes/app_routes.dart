import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/presentation/auth/fogot_password/forgot_password.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/auth/register/register.dart';
import 'package:chatapp/presentation/chat/chat_room/pages/chat_room_page.dart';
import 'package:chatapp/presentation/device/device_administration.dart';
import 'package:chatapp/presentation/friends/find_new_friend/find_new_friend.dart';
import 'package:chatapp/presentation/friends/friends_infor/friends_infor.dart';
import 'package:chatapp/presentation/group/create_group/create_group.dart';
import 'package:chatapp/presentation/group/group_details/pages/group_details_page.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
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
        return _buildRoute(
          settings,
          ChatRoomPage(
            id: settings.arguments as String,
            type: "friend",
          ),
        );
      case RouteName.groupChatRoom:
        return _buildRoute(
          settings,
          ChatRoomPage(
            id: settings.arguments as String,
            type: "group",
          ),
        );
      case RouteName.updatePassword:
        return _buildRoute(settings, const UpdatePasswordPage());
      case RouteName.deviceAdministration:
        return _buildRoute(settings, const DeviceMainPage());
      case RouteName.createGroup:
        return _buildRoute(settings, const CreateGroupPage());
      case RouteName.groupDetails:
        return _buildRoute(settings, const GroupDetailPage());
      case RouteName.googleMap:
        return _buildRoute(settings, const MapPage());

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
