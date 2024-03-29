import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giphy_get/l10n.dart';

import '../../../core/config/app_theme.dart';
import '../../../core/routes/app_routes.dart';

class MMaterialApp extends StatelessWidget {
  const MMaterialApp({
    Key? key,
    required this.keyMaterialApp,
    required this.initialRoute,
    this.onGenerateRoute,
    this.homeWidget,
    this.navigatorKey,
    this.themeMode,
    this.locale,
  }) : super(key: key);

  final String keyMaterialApp;
  final String initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final Widget? homeWidget;
  final GlobalKey<NavigatorState>? navigatorKey;
  final ThemeMode? themeMode;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'CS Chat App',
          key: ValueKey(keyMaterialApp),
          debugShowCheckedModeBanner: false,
          locale: locale,
          localizationsDelegates: [
            ...AppLocalizations.localizationsDelegates,
            GiphyGetUILocalizations.delegate
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          themeMode: themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          navigatorKey: navigatorKey,
          navigatorObservers: [
            AppRoutes.routeObserver,
          ],
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute,
        );
      },
      child: homeWidget,
    );
  }
}
