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
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Future<Response> getListChat(String id, String ) async {
  //   try {
  //     return await _service.dio.post(
  //       "${BaseService.userPath}/request/id",
  //     );
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  //get list friend
  Future<Response> findFriend() async {
    try {
      return await _service.dio.get(
        "${BaseService.friendPath}/",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> deleteFriend(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/$id",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> blockFriend(String id) async {
    try {
      return await _service.dio.put(
        "${BaseService.friendPath}/$id/block",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> unBlockFriend(String id) async {
    try {
      return await _service.dio.put(
        "${BaseService.friendPath}/$id/unblock",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getSendRequest() async {
    try {
      return await _service.dio.get(
        "${BaseService.friendPath}/request/sent",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> recallRequest(String id) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/request/$id",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> getReceiveRequest() async {
    try {
      return await _service.dio.get(
        "${BaseService.friendPath}/request/received",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> acceptReceiveRequest(String userId) async {
    try {
      return await _service.dio.post(
        "${BaseService.friendPath}/request/$userId/accept",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Response> rejectReceiveRequest(String userId) async {
    try {
      return await _service.dio.delete(
        "${BaseService.friendPath}/request/$userId/reject",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
