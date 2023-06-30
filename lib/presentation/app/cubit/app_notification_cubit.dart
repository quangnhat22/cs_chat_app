import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_notification_state.dart';
part 'app_notification_cubit.freezed.dart';

@Singleton()
class AppNotificationCubit extends Cubit<AppNotificationState> {
  AppNotificationCubit() : super(const AppNotificationState.initial()) {
    _initializeNotificationsEventListeners();
  }

  void _initializeNotificationsEventListeners() async {
    // Only after at least the action method is set, the notification events are delivered
    await AwesomeNotifications().setListeners(
      onNotificationDisplayedMethod: _onNotificationDisplayedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> _onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    log(receivedNotification.toString(), name: "onNotificationDisplay");
  }

  @pragma("vm:entry-point")
  Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Always ensure that all plugins was initialized
    WidgetsFlutterBinding.ensureInitialized();
    log(receivedAction.toString(), name: "onReceivedAction");
    if (receivedAction.channelKey == "basic_channel") {
      await receiveCallNotificationAction(receivedAction);
    }
  }

  @pragma("vm:entry-point")
  Future<void> receiveCallNotificationAction(
      ReceivedAction receivedAction) async {
    switch (receivedAction.buttonKeyPressed) {
      case 'REJECT':
        // Is not necessary to do anything, because the reject button is
        // already auto dismissible
        break;

      case 'ACCEPT':
        // NavigationUtil.loadSingletonPage(
        //   targetPage: RouteName.personalCall,
        //   receivedAction: receivedAction,
        // );
        break;

      default:
        // loadSingletonPage(App.navigatorKey.currentState,
        //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
        break;
    }
  }

  Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    switch (receivedAction.buttonKeyPressed) {
      case 'REJECT':
        // Is not necessary to do anything, because the reject button is
        // already auto dismissible
        break;

      case 'ACCEPT':
        // NavigationUtil.loadSingletonPage(
        //   targetPage: RouteName.personalCall,
        //   receivedAction: receivedAction,
        // );
        break;

      default:
        // loadSingletonPage(App.navigatorKey.currentState,
        //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
        break;
    }
  }
}
