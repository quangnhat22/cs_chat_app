import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const colorScheme = ColorScheme(
    primary: Color(0xFF49BCF6),
    secondary: Color(0xFF33A1FD),
    surface: Colors.white,
    background: Colors.white,
    error: Color(0xFFEB4335),
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: "Roboto",
        ),
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: colorScheme.primary,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xff1a1d1f),
    useMaterial3: true,
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: "Roboto",
        ),
    colorScheme: colorScheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: colorScheme.primary,
    ),
    filledButtonTheme: const FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
  );
}
