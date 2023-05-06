import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006689),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFC2E8FF),
    onPrimaryContainer: Color(0xFF001E2C),
    //onPrimaryFixedVariant: Color(0xFF004D68),
    secondary: Color(0xFF6151A6),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE6DEFF),
    onSecondaryContainer: Color(0xFF1D0160),
    //secondaryFixedDim: Color(0xFFCBBEFF),
    //onSecondaryFixedVariant: Color(0xFF49398C),
    tertiary: Color(0xFF006C45),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFF8FF7BF),
    onTertiaryContainer: Color(0xFF002112),
    //tertiaryFixedDim: Color(0xFF73DAA4),
    //onTertiaryFixedVariant: Color(0xFF005233),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    outline: Color(0xFF71787D),
    background: Color(0xFFFBFCFE),
    onBackground: Color(0xFF191C1E),
    surface: Color(0xFFF8F9FC),
    onSurface: Color(0xFF191C1E),
    surfaceVariant: Color(0xFFDCE3E9),
    onSurfaceVariant: Color(0xFF41484D),
    inverseSurface: Color(0xFF2E3133),
    onInverseSurface: Color(0xFFF0F1F3),
    inversePrimary: Color(0xFF77D1FF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006689),
    outlineVariant: Color(0xFFC0C7CD),
    scrim: Color(0xFF000000),
    // surfaceContainerHighest: Color(0xFFE1E2E5),
    // surfaceContainerHigh: Color(0xFFE7E8EA),
    // surfaceContainer: Color(0xFFEDEEF0),
    // surfaceContainerLow: Color(0xFFF3F3F6),
    // surfaceContainerLowest: Color(0xFFFFFFFF),
    // surfaceBright: Color(0xFFF8F9FC),
    // surfaceDim: Color(0xFFD9DADC),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF77D1FF),
    onPrimary: Color(0xFF003549),
    primaryContainer: Color(0xFF004D68),
    onPrimaryContainer: Color(0xFFC2E8FF),
    //onPrimaryFixed: Color(0xFF001E2C),
    secondary: Color(0xFFCBBEFF),
    onSecondary: Color(0xFF322074),
    secondaryContainer: Color(0xFF49398C),
    onSecondaryContainer: Color(0xFFE6DEFF),
    //onSecondaryFixed: Color(0xFF1D0160),
    tertiary: Color(0xFF73DAA4),
    onTertiary: Color(0xFF003822),
    tertiaryContainer: Color(0xFF005233),
    onTertiaryContainer: Color(0xFF8FF7BF),
    //onTertiaryFixed: Color(0xFF002112),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFF8A9297),
    background: Color(0xFF191C1E),
    onBackground: Color(0xFFE1E2E5),
    surface: Color(0xFF111416),
    onSurface: Color(0xFFC5C6C9),
    surfaceVariant: Color(0xFF41484D),
    onSurfaceVariant: Color(0xFFC0C7CD),
    inverseSurface: Color(0xFFE1E2E5),
    onInverseSurface: Color(0xFF191C1E),
    inversePrimary: Color(0xFF006689),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF77D1FF),
    outlineVariant: Color(0xFF41484D),
    scrim: Color(0xFF000000),
    // surfaceContainerHighest: Color(0xFF323537),
    // surfaceContainerHigh: Color(0xFF282A2C),
    // surfaceContainer: Color(0xFF1D2022),
    // surfaceContainerLow: Color(0xFF191C1E),
    // surfaceContainerLowest: Color(0xFF0C0F10),
    // surfaceBright: Color(0xFF37393B),
    // surfaceDim: Color(0xFF111416),
  );
}
