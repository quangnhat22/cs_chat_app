import 'package:chatapp/data/data_sources/local/other_local_data_src.dart';
import 'package:chatapp/data/data_sources/remote/base_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class NotificationsService {
  NotificationsService(this._service, this._localDataSrc);

  final BaseService _service;
  final OtherLocalDataSrc _localDataSrc;

  Future<Response> getListNotification() async {
    try {
      return await _service.dio.get(BaseService.notficationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteAllNotification() async {
    try {
      return await _service.dio.delete(BaseService.notficationPath);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteNotificationById(String id) async {
    try {
      return await _service.dio.delete("${BaseService.notficationPath}/$id");
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
