import 'package:chatapp/data/data_sources/remote/base_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeviceService {
  DeviceService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> getListDevice() async {
    try {
      return await _service.dio.get(
        BaseService.devicePath,
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> updateDevice(
      String name, String? pushNotificationToken) async {
    try {
      return await _service.dio.put(BaseService.devicePath, data: {
        "name": name,
        "push_notification_token": pushNotificationToken ?? '',
      });
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteDevice(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.devicePath}/$id",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
