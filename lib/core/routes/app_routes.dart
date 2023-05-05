import 'package:chatapp/presentation/auth/fogot_password/forgot_password.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/auth/register/register.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
import 'package:chatapp/presentation/loading/loading_page.dart';
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
      case RouteName.forgotPasswordPage:
        return _buildRoute(
          settings,
          const ForgotPasswordPage(),
        );
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

  // static MaterialPageRoute _buildRouteDialog(
  //     RouteSettings settings, Widget builder) {
  //   return MaterialPageRoute(
  //     settings: settings,
  //     fullscreenDialog: true,
  //     builder: (BuildContext context) => builder,
  //   );
  // }

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
