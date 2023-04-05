import 'package:chatapp/presentation/login/views/views.dart';
import 'package:flutter/material.dart';

import '../../core/config/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CS Chat App',
      debugShowCheckedModeBanner: false,
      //locale: ,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
    );
  }
}
