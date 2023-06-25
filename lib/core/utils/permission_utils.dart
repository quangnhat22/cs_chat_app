import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  const PermissionUtils._();

  static Future<void> checkPermissions() async {
    final status = await Permission.notification.request();

    if (status.isPermanentlyDenied) {
      log('Notification Permission disabled');
    }
  }

  static Future<bool> _checkServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<Position> getCurrentLocation() async {
    final isEnableService = await _checkServiceEnable();
    if (!isEnableService) {
      return Future.error('Location service is not enable');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
