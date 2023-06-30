// import 'dart:developer';

// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:injectable/injectable.dart';

// @Injectable()
// class NotificationController {
//   Future<void> initializeNotificationsEventListeners() async {
//     // Only after at least the action method is set, the notification events are delivered
//     AwesomeNotifications().setListeners(
//       onNotificationDisplayedMethod: onNotificationDisplayedMethod,
//       onActionReceivedMethod: onActionReceivedMethod,
//     );
//   }

//   @pragma("vm:entry-point")
//   static Future<void> onNotificationDisplayedMethod(
//       ReceivedNotification receivedNotification) async {
//     log(receivedNotification.toString(), name: "onNotificationDisplay");
//   }

//   @pragma("vm:entry-point")
//   static Future<void> onActionReceivedMethod(
//       ReceivedAction receivedAction) async {
//     // Always ensure that all plugins was initialized
//     //WidgetsFlutterBinding.ensureInitialized();
//     log(receivedAction.toString(), name: "onReceivedAction");
//     if (receivedAction.channelKey == "basic_channel") {
//       await receiveCallNotificationAction(receivedAction);
//     }
//   }

//   static Future<void> receiveCallNotificationAction(
//       ReceivedAction receivedAction) async {
//     switch (receivedAction.buttonKeyPressed) {
//       case 'REJECT':
//         // Is not necessary to do anything, because the reject button is
//         // already auto dismissible
//         break;

//       case 'ACCEPT':
//         // NavigationUtil.loadSingletonPage(
//         //   targetPage: RouteName.personalCall,
//         //   receivedAction: receivedAction,
//         // );
//         break;

//       default:
//         // loadSingletonPage(App.navigatorKey.currentState,
//         //     targetPage: PAGE_PHONE_CALL, receivedAction: receivedAction);
//         break;
//     }
//   }
// }
