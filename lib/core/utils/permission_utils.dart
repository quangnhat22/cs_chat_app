import 'package:geolocator/geolocator.dart';

class PermissionUtils {
  const PermissionUtils._();

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
