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

  Future<Response> getListGroup() async {
    try {
      return await _service.dio.get(
        BaseService.groupPath,
      );
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

  Future<Response> getListGroupChat({
    required String groupId,
    String? latestMessageId,
    int? limit = 20,
  }) async {
    try {
      if (latestMessageId == null) {
        return await _service.dio.get(
          "${BaseService.groupPath}/$groupId/chat",
        );
      } else {
        return await _service.dio.get(
          "${BaseService.groupPath}/$groupId/chat?last_id=$latestMessageId",
        );
      }
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
