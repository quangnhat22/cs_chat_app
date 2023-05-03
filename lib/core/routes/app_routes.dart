import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/auth/register/register.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
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
