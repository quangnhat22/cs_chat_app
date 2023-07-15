import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../utils/global_keys.dart';

class NavigationUtil {
  static NavigatorState? get navigatorKey =>
      AppGlobalKeys.navigatorKey.currentState;

  static Future push({required Widget page}) async {
    return await navigatorKey?.push(MaterialPageRoute(builder: (_) => page));
  }

  static Future pushNamed({required String route, Object? args}) async {
    return await navigatorKey?.pushNamed(
      route,
      arguments: args,
    );
  }

  static Future pushAndRemoveUntil({required Widget page}) async {
    return await navigatorKey?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
      ),
      (route) => false,
    );
  }

  static Future pushNamedAndRemoveUntil(
      {required String route, Object? args}) async {
    return await navigatorKey?.pushNamedAndRemoveUntil(
      route,
      (r) => false,
      arguments: args,
    );
  }

  static pop({Object? result}) {
    navigatorKey?.pop(result);
  }

  static loadSingletonPage(
      {required String targetPage, required ReceivedAction receivedAction}) {
    // Avoid to open the notification details page over another details page already opened
    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    navigatorKey?.pushNamedAndRemoveUntil(targetPage, (route) {
      return (route.settings.name != targetPage) || route.isFirst;
    }, arguments: {"received-action": receivedAction});
  }
}

class UnAuthNavigationUtil {
  static NavigatorState? get _navigatorKey =>
      AppGlobalKeys.unAuthNavigatorKey.currentState;

  static Future push({required Widget page}) async {
    return await _navigatorKey?.push(MaterialPageRoute(builder: (_) => page));
  }

  static Future pushNamed({required String route, Object? args}) async {
    return await _navigatorKey?.pushNamed(
      route,
      arguments: args,
    );
  }

  static Future pushAndRemoveUntil({required Widget page}) async {
    return await _navigatorKey?.pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (_) => page,
      ),
      (route) => false,
    );
  }

  static Future pushNamedAndRemoveUntil(
      {required String route, Object? args}) async {
    return await _navigatorKey?.pushNamedAndRemoveUntil(
      route,
      (r) => false,
      arguments: args,
    );
  }

  static pop({Object? result}) {
    _navigatorKey?.pop(result);
  }
}
