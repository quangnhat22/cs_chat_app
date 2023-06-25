import 'package:chatapp/core/config/firebase_options.dart';
import 'package:chatapp/core/di/injector.dart' as di;
import 'package:chatapp/core/utils/permission_utils.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/presentation/app/app.dart';
import 'package:chatapp/service/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_bloc_observer.dart';

void main() async {
  await _initialize.call();
  await _initLocalNotification();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionUtils.checkPermissions();

  await FlutterDownloader.initialize(
      debug: true,
      // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          true // option: set to false to disable working with http links (default: false)
      );
  // .dev
  Bloc.observer = AppObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  _registerAdapterHive();
  await di.configureDependencies();
}

void _registerAdapterHive() {
  Hive.registerAdapter(UserModelAdapter());
}

Future<void> _initLocalNotification() async {
  await NotificationService.initializeLocalNotifications(debug: true);
  await NotificationService.initializeRemoteNotifications(debug: true);
}
