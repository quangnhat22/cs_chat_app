import 'package:chatapp/common/widgets/stateless/m_material_app.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/global_keys.dart';
import 'package:chatapp/presentation/app/bloc/app_bloc.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/app_routes.dart';
import '../../core/routes/route_name.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AppUnAuthorized:
              return const MMaterialApp(
                keyMaterialApp: "App_UnAuthorized",
                initialRoute: RouteName.loginPage,
                onGenerateRoute: AppRoutes.unAuthorizedRoute,
                homeWidget: LoginPage(),
              );
            case AppAuthorized:
              return MMaterialApp(
                keyMaterialApp: "App_Authorized",
                initialRoute: RouteName.homePage,
                navigatorKey: AppGlobalKeys.navigatorKey,
                onGenerateRoute: AppRoutes.authorizedRoute,
                homeWidget: const HomePage(),
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
