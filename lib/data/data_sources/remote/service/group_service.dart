import 'package:chatapp/data/data_sources/remote/base_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GroupService {
  GroupService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> createGroup(
      String name, String imageUrl, List<String> members) async {
    try {
      return await _service.dio.post(BaseService.groupPath, data: {
        "name": name,
        "image_url": imageUrl,
        'members': members,
      });
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getListGroup(String? query) async {
    try {
      String endPoint = BaseService.groupPath;
      if (query != null) {
        endPoint += "?type=$query";
      }
      return await _service.dio.get(endPoint);
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSentRequest() async {
    try {
      return await _service.dio.get(
        "${BaseService.groupPath}/request/sent",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getReceiveRequest() async {
    try {
      return await _service.dio.get(
        "${BaseService.groupPath}/request/received",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> rejectRequest(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.groupPath}/request/$id/reject",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> sendGroupRequest(String groupId, String friendId) async {
    try {
      return await _service.dio.post(
        "${BaseService.groupPath}/request/$groupId/$friendId",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> recallGroupRequest(String groupId, String friendId) async {
    try {
      return await _service.dio.delete(
        "${BaseService.groupPath}/request/$groupId/$friendId",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> acceptRequest(String groupId) async {
    try {
      return await _service.dio.post(
        "${BaseService.groupPath}/request/$groupId/accept",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getListMessage({
    required String id,
    required int limit,
    required String order,
    String? type,
    String? latestMessageId,
  }) async {
    try {
      String endPointApi =
          "${BaseService.groupPath}/$id/chat?limit=$limit&order=$order";

      if (latestMessageId != null && !latestMessageId.contains("-")) {
        endPointApi += "&last_id=$latestMessageId";
      }
      if (type != null) {
        endPointApi += "&type=$type";
      }

      return await _service.dio.get(endPointApi);
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
