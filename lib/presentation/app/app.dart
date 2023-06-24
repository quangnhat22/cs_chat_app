import 'package:chatapp/common/widgets/stateless/m_material_app.dart';
import 'package:chatapp/core/di/injector.dart';
import 'package:chatapp/core/utils/global_keys.dart';
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart';
import 'package:chatapp/presentation/app/bloc/app_bloc.dart';
import 'package:chatapp/presentation/auth/login/login.dart';
import 'package:chatapp/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/app_routes.dart';
import '../../core/routes/route_name.dart';
import '../others/loading_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AppBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<AppSettingsCubit>(),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return BlocBuilder<AppSettingsCubit, AppSettingsState>(
            builder: (context, AppSettingsState appSettingState) {
              switch (state.runtimeType) {
                case AppUnAuthorized:
                  return MMaterialApp(
                    keyMaterialApp: "App_UnAuthorized",
                    initialRoute: RouteName.loginPage,
                    navigatorKey: AppGlobalKeys.unAuthNavigatorKey,
                    onGenerateRoute: AppRoutes.unAuthorizedRoute,
                    homeWidget: const LoginPage(),
                  );
                case AppAuthorized:
                  return MMaterialApp(
                    keyMaterialApp: "App_Authorized",
                    initialRoute: RouteName.homePage,
                    navigatorKey: AppGlobalKeys.navigatorKey,
                    onGenerateRoute: AppRoutes.authorizedRoute,
                    locale: appSettingState.locale,
                    themeMode: appSettingState.theme,
                    homeWidget: const HomePage(),
                  );
                default:
                  return MMaterialApp(
                    keyMaterialApp: "App_Loading",
                    initialRoute: "/",
                    onGenerateRoute: AppRoutes.loadingRoute,
                    homeWidget: const LoadingPage(),
                    locale: appSettingState.locale,
                    themeMode: appSettingState.theme,
                  );
              }
            },
          );
        },
      ),
    );
  }
}
