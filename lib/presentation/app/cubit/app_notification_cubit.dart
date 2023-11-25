import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/data/models/notification_model.dart';
import 'package:chatapp/domain/modules/friend/friend_usecase.dart';
import 'package:chatapp/domain/modules/group/group_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_notification_state.dart';
part 'app_notification_cubit.freezed.dart';

@Singleton()
class AppNotificationCubit extends Cubit<AppNotificationState> {
  final FriendUseCase _friendUseCase;
  final GroupUseCase _groupUseCase;

  AppNotificationCubit(this._friendUseCase, this._groupUseCase)
      : super(const AppNotificationState.initial()) {
    //_initializeNotificationsEventListeners();
  }

  //void _initializeNotificationsEventListeners() async {
  // Only after at least the action method is set, the notification events are delivered
  // await AwesomeNotifications().setListeners(
  //   onNotificationDisplayedMethod: _onNotificationDisplayedMethod,
  //   onActionReceivedMethod: onActionReceivedMethod,
  //   onDismissActionReceivedMethod: onDismissActionReceivedMethod,
  // );
  //}

  // Future<void> _onNotificationDisplayedMethod(
  //     ReceivedNotification receivedNotification) async {
  //   log(receivedNotification.toString(), name: "onNotificationDisplay");
  // }

  // @pragma("vm:entry-point")
  // static Future<void> onActionReceivedMethod(
  //     ReceivedAction receivedAction) async {
  //   // Always ensure that all plugins was initialized
  //   WidgetsFlutterBinding.ensureInitialized();
  //   log(receivedAction.toString(), name: "onReceivedAction");
  //   if (receivedAction.channelKey == "basic_channel") {
  //     await receiveCallNotificationAction(receivedAction);
  //   }
  // }

  // @pragma("vm:entry-point")
  // static Future<void> receiveCallNotificationAction(
  //     ReceivedAction receivedAction) async {
  //   switch (receivedAction.buttonKeyPressed) {
  //     case 'REJECT':
  //       // Is not necessary to do anything, because the reject button is
  //       // already auto dismissible
  //       break;

  //     case 'ACCEPT':
  //       // NavigationUtil.loadSingletonPage(
  //       //   targetPage: RouteName.personalCall,
  //       //   receivedAction: receivedAction,
  //       // );
  //       break;

  //     default:
  //       // loadSingletonPage(App.navigatorKey.currentState,
  //       //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
  //       break;
  //   }
  // }

  // Future<void> onDismissActionReceivedMethod(
  //     ReceivedAction receivedAction) async {
  //   try {
  //     if (receivedAction.payload == null) return;
  //     final notiJson = jsonDecode(receivedAction.payload!["notification"]!);
  //     final payload = NotificationsModel.fromJson(notiJson);
  //     if (payload.action == 'receive-friend-request') {
  //       switch (receivedAction.buttonKeyPressed) {
  //         case 'deny':
  //           if (payload.prep?.id != null) {
  //             await _friendUseCase.rejectReceiveRequest(payload.prep!.id);
  //           }
  //           break;

  //         case 'accept':
  //           if (payload.prep?.id != null) {
  //             await _friendUseCase.acceptReceiveRequest(payload.prep!.id);
  //           }
  //           break;

  //         default:
  //           NavigationUtil.loadSingletonPage(
  //             targetPage: RouteName.homePage,
  //             receivedAction: receivedAction,
  //           );
  //           break;
  //       }
  //     }
  //     if (payload.action == 'receive-group-request') {
  //       switch (receivedAction.buttonKeyPressed) {
  //         case 'deny':
  //           await _groupUseCase.rejectRequest(payload.indirect!.id);
  //           break;

  //         case 'accept':
  //           await _groupUseCase.acceptRequest(payload.indirect!.id);
  //           break;

  //         default:
  //           NavigationUtil.loadSingletonPage(
  //             targetPage: RouteName.homePage,
  //             receivedAction: receivedAction,
  //           );
  //           break;
  //       }
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
