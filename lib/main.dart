import 'package:chatapp/core/config/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/presentation/app/app.dart';
import 'package:chatapp/core/di/injector.dart' as di;

void main() async {
  await _initialize.call();
  runApp(const App());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.configureDependencies();
}
