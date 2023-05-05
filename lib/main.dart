import 'package:chatapp/core/config/firebase_options.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/presentation/app/app.dart';
import 'package:chatapp/core/di/injector.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_bloc_observer.dart';

void main() async {
  await _initialize.call();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  // .dev
  Bloc.observer = AppObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  _registerApdateHive();
  await di.configureDependencies();
}

void _registerApdateHive() {
  Hive.registerAdapter(UserModelAdapter());
}
