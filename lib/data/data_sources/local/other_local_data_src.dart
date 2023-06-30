import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class OtherLocalDataSrc {
  static Box? _box;
  final String _otherBox = "other_box";
  final String _friendRequestKey = "_friendRequestKey";
  final String _groupRequestKey = "_groupRequestKey";
  final String _notificationKey = "_notificationKey";
  final String _newChatRoomKey = "_newChatRoomKey";

  Future<Box> _openBox() async {
    _box ??= await Hive.openBox(_otherBox);
    return _box!;
  }

  Future<void> setFriendRequest() async {
    await _openBox().then((box) async {
      await box.put(_friendRequestKey, 1);
    });
  }

  Future<void> setGroupRequest() async {
    await _openBox().then((box) async {
      await box.put(_groupRequestKey, 1);
    });
  }

  Future<void> setNotification() async {
    await _openBox().then((box) async {
      await box.put(_notificationKey, 1);
    });
  }

  Future<void> setNewChatRoomReceive(String newChatRoomId) async {
    await _openBox().then((box) async {
      List<String> listNewChatRoom =
          await box.get(_newChatRoomKey, defaultValue: []);
      listNewChatRoom = [...listNewChatRoom, newChatRoomId];
      await box.put(_newChatRoomKey, listNewChatRoom);
    });
  }

  Future<void> deleteChatRoomId(String newChatRoomId) async {
    await _openBox().then((box) async {
      List<String> listNewChatRoom =
          await box.get(_newChatRoomKey, defaultValue: []);
      listNewChatRoom = listNewChatRoom
          .where((chatRoomId) => chatRoomId != newChatRoomId)
          .toList();
      await box.put(_newChatRoomKey, listNewChatRoom);
    });
  }

  Stream<int?> getFriendRequest() async* {
    final box = await _openBox();
    yield* box.watch(key: _friendRequestKey).map((event) {
      return event.value;
    });
  }

  Stream<int?> getGroupRequest() async* {
    final box = await _openBox();
    yield* box.watch(key: _groupRequestKey).map((event) {
      return event.value;
    });
  }

  Stream<int?> getNotificationRequest() async* {
    final box = await _openBox();
    yield* box.watch(key: _notificationKey).map((event) {
      return event.value;
    });
  }

  Future<void> deleteBoxOther() async {
    await _openBox().then((_) async {
      await Hive.box(_otherBox).clear();
    });
  }
}
