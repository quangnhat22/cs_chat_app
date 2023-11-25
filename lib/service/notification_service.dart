// import 'dart:developer';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:awesome_notifications_fcm/awesome_notifications_fcm.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';

// @Singleton()
// class NotificationService {
//   static Future<void> initializeLocalNotifications(
//       {required bool debug}) async {
//     await AwesomeNotifications().initialize(
//       null,
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Alerts',
//           channelDescription: 'Notification tests as alerts',
//           playSound: true,
//           importance: NotificationImportance.High,
//           defaultPrivacy: NotificationPrivacy.Private,
//         ),
//         NotificationChannel(
//           channelKey: 'local_chatroom_new_message_channel',
//           channelName: 'New Message',
//           channelDescription: 'new message',
//           playSound: true,
//           importance: NotificationImportance.High,
//           defaultPrivacy: NotificationPrivacy.Private,
//         )
//       ],
//       debug: debug,
//     );

//     await AwesomeNotifications()
//         .requestPermissionToSendNotifications()
//         .then((isAllowed) async {
//       if (!isAllowed) {
//         await AwesomeNotifications().requestPermissionToSendNotifications();
//       }
//     });
//   }

//   static Future<void> initializeRemoteNotifications(
//       {required bool debug}) async {
//     await Firebase.initializeApp();
//     await AwesomeNotificationsFcm().initialize(
//         onFcmSilentDataHandle: NotificationService.mySilentDataHandle,
//         onFcmTokenHandle: NotificationService.myFcmTokenHandle,
//         onNativeTokenHandle: NotificationService.myNativeTokenHandle,
//         licenseKeys: null,
//         debug: debug);
//   }

//   Future<String> requestFirebaseToken() async {
//     if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
//       try {
//         final token = await AwesomeNotificationsFcm().requestFirebaseAppToken();
//         log('==================FCM Token==================');
//         log(token);
//         log('======================================');
//         return token;
//       } catch (exception) {
//         debugPrint('$exception');
//       }
//     } else {
//       debugPrint('Firebase is not available on this project');
//     }
//     return '';
//   }

//   Future<void> checkPermissioNotification() async {
//     bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
//     if (!isAllowed) {
//       await AwesomeNotifications().requestPermissionToSendNotifications();
//     }
//   }

//   Future<String> getFirebaseMessagingToken() async {
//     String firebaseAppToken = '';
//     if (await AwesomeNotificationsFcm().isFirebaseAvailable) {
//       try {
//         firebaseAppToken =
//             await AwesomeNotificationsFcm().requestFirebaseAppToken();
//       } catch (exception) {
//         debugPrint('$exception');
//       }
//     } else {
//       debugPrint('Firebase is not available on this project');
//     }
//     return firebaseAppToken;
//   }

//   /// Use this method to execute on background when a silent data arrives (even while terminated)
//   @pragma("vm:entry-point")
//   static Future<void> mySilentDataHandle(FcmSilentData silentData) async {
//     log('"SilentData": ${silentData.toString()}');
//     if (silentData.createdLifeCycle != NotificationLifeCycle.Foreground) {
//       log("BACKGROUND");
//     } else {
//       log("FOREGROUND");
//     }

//     log("starting long task");
//     await Future.delayed(const Duration(seconds: 4));
//     log("long task done");
//   }

//   /// Use this method to detect when a new fcm token is received
//   @pragma("vm:entry-point")
//   static Future<void> myFcmTokenHandle(String token) async {
//     log('FCM Token:"$token"');
//   }

//   /// Use this method to detect when a new native token is received
//   @pragma("vm:entry-point")
//   static Future<void> myNativeTokenHandle(String token) async {
//     log('Native Token:"$token"');
//   }
// }
