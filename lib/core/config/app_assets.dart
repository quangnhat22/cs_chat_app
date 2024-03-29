import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    'assets/images/chat_place_holder.png',
    fit: BoxFit.cover,
    width: 256.0,
    height: 256.0,
  );

  // ignore: non_constant_identifier_names
  static final csChat = Image.asset(
    'assets/icons/CSChat.png',
    fit: BoxFit.cover,
  );
  static final checkIcon = Image.asset(
    'assets/icons/CheckIcon.png',
    fit: BoxFit.cover,
  );

  static final notFoundSvg = SvgPicture.asset(
    'assets/images/not_found.svg',
    semanticsLabel: 'A red up arrow',
  );

  static final sendEmailSuccessJpg = Image.asset(
    'assets/images/send_email_success.jpg',
    fit: BoxFit.cover,
  );

  static final successIcon = SvgPicture.asset(
    'assets/icons/success.svg',
    width: 120,
    height: 120,
  );

  static final warningIcon = SvgPicture.asset(
    'assets/icons/warning.svg',
    width: 120,
    height: 120,
  );

  static final errorIcon = SvgPicture.asset(
    'assets/icons/error.svg',
    width: 120,
    height: 120,
  );

  static final noDataImg = Image.asset(
    'assets/images/no_data.jpg',
    fit: BoxFit.cover,
  );
}
