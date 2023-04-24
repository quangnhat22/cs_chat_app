import 'package:chatapp/common/widgets/stateless/m_material_app.dart';
import 'package:chatapp/presentation/app/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/routes/app_routes.dart';
import '../../core/routes/route_name.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AppUnAuthorized:
              return const MMaterialApp(
                initialRoute: RouteName.loginPage,
                onGenerateRoute: AppRoutes.unAuthorizedRoute,
              );
            case AppAuthorized:
              return const MMaterialApp(
                initialRoute: RouteName.homePage,
                onGenerateRoute: AppRoutes.authorizedRoute,
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
