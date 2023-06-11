import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:chatapp/data/data_sources/firebase/file_firebase.dart';
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

import '../../../core/config/app_config.dart';

@Injectable()
class ChatWebSocket {
  final AuthLocalDataSrc localDataSrc;
  final FileStorageFirebase storageFirebase;
  late final IOWebSocketChannel _channel;

  final String url = "${AppConfig.baseUrl}/ws/chat";

  late final StreamController _streamController;

  ChatWebSocket({required this.localDataSrc, required this.storageFirebase}) {
    _streamController = StreamController();
  }

  Future<void> connect() async {
    try {
      final accessToken = await localDataSrc.getAccessToken();
      _channel = IOWebSocketChannel.connect(Uri.parse("ws://$url"),
          headers: {"Authorization": "Bearer $accessToken"}
          // headers: {'Connection': 'upgrade', 'Upgrade': 'websocket'},
          );

      await _channel.ready;

      _streamController.addStream(_channel.stream);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void disconnect() {
    try {
      _channel.sink.close();
      _streamController.close();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> sendMessage(String type, String message, String receiverUserId,
      String? option) async {
    String? messageContent = message;
    try {
      if (type == "image" ||
          type == "video" ||
          type == "audio" ||
          type == "file") {
        messageContent = await storageFirebase.uploadFile(message);
        if (messageContent == null) return;
      }
      _channel.sink.add(jsonEncode({
        "type": type,
        "receiver_id": receiverUserId,
        "message": messageContent,
        "optional": option
      }));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<MessageModel> getStream() {
    try {
      //return _channel.stream.map((event) );
      return _streamController.stream.map((event) {
        final json = jsonDecode(event) as Map<String, dynamic>;
        log(json.toString());

        return MessageModel.fromJson(json);
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
