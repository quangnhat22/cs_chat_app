import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

import '../../../core/config/app_config.dart';

@Singleton()
class ChatWebSocket {
  final AuthLocalDataSrc localDataSrc;
  late final _channel;

  final String url = "${AppConfig.baseUrl}/ws/chat";

  ChatWebSocket({required this.localDataSrc}) {
    connect();
  }

  void connect() async {
    final accessToken = await localDataSrc.getAccessToken();
    _channel = IOWebSocketChannel.connect(Uri.parse("ws://$url"),
        headers: {"Authorization": "Bearer $accessToken"}
        // headers: {'Connection': 'upgrade', 'Upgrade': 'websocket'},
        );

    await _channel.ready;
    _channel.messages.listen((message) {
      debugPrint(message);
    });
  }

  void disconnect() {
    _channel.sink.close();
  }

  void sendMessage(String type, String message, String receiverUserId) {
    _channel.sink.add(message);
  }

  Stream<dynamic> getStream() {
    return _channel.stream.map((event) => event.toString());
  }
}
