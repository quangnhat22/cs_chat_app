import 'package:flutter/material.dart';

class AppAssets {
  static final logoGoogle = Image.asset(
    'assets/icons/google.png',
    width: 26,
  );

  static final logoAppLight = Image.asset(
    'assets/logos/logo_light.png',
    fit: BoxFit.cover,
  );

  static final logoApp = Image.asset(
    'assets/logos/logo.png',
    fit: BoxFit.cover,
    color: Colors.white,
  );

  static final loadingGif = Image.asset(
    'assets/gifs/loading.gif',
    height: 256.0,
    width: 256.0,
  );

  static const emptyAvatar = AssetImage(
    'assets/images/empty_avatar.png',
  );

  static final chatPlaceHolder = Image.asset(
    'assets/images/ChatPlaceholder.png',
    fit: BoxFit.cover,
    width: 256.0,
    height: 256.0,
  );
}
