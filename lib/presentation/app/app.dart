import 'package:chatapp/presentation/app/bloc/app_bloc.dart';
import 'package:chatapp/routes/app_routes.dart';
import 'package:chatapp/routes/route_name.dart';
import 'package:chatapp/utils/global_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AppLoading:
              return const MaterialApp(
                home: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case AppUnAuthorized:
              return MaterialApp(
                title: 'CS Chat App',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                navigatorKey: AppGlobalKeys.navigatorKey,
                navigatorObservers: [
                  AppRoutes.routeObserver,
                ],
                initialRoute: RouteName.welcomePage,
                onGenerateRoute: AppRoutes.unAuthorizedRoute,
              );
            default:
              return const MaterialApp(
                home: Center(
                  child: CircularProgressIndicator(),
                ),
              );
          }
        },
      ),
    );
  }
}
