import 'package:chatapp/data/data_sources/remote/base_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FriendService {
  FriendService({required BaseService service}) : _service = service;

  final BaseService _service;

  Future<Response> sendRequest(String id) async {
    try {
      return await _service.dio.post(
        "${BaseService.friendPath}/request/$id",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getListChat(String userId) async {
    try {
      return await _service.dio.post(
        "${BaseService.friendPath}/$userId/chat",
      );
    } on DioError catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get list friend
  Future<Response> findFriend() async {
    try {
      return await _service.dio.get(
        "${BaseService.friendPath}/",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteFriend(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/$id",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> blockFriend(String id) async {
    try {
      return await _service.dio.put(
        "${BaseService.friendPath}/$id/block",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> unBlockFriend(String id) async {
    try {
      return await _service.dio.put(
        "${BaseService.friendPath}/$id/unblock",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSendRequest() async {
    try {
      return await _service.dio.get(
        "${BaseService.friendPath}/request/sent",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> recallRequest(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/request/$id",
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
        "${BaseService.friendPath}/request/received",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> acceptReceiveRequest(String userId) async {
    try {
      return await _service.dio.post(
        "${BaseService.friendPath}/request/$userId/accept",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> rejectReceiveRequest(String userId) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/request/$userId/reject",
      );
    } on DioError catch (e) {
      throw Exception(e.message.toString());
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
