import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/models/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

import '../../../core/config/app_config.dart';

@Injectable()
class NewMessageSocket {
  final AuthLocalDataSrc _localDataSrc;

  NewMessageSocket(this._localDataSrc) {
    _streamController = StreamController();
  }

  late final IOWebSocketChannel _channel;

  final String url = AppConfig.baseUrl;

  late final StreamController _streamController;

  Future<void> connect() async {
    try {
      final accessToken = await _localDataSrc.getAccessToken();
      _channel = IOWebSocketChannel.connect(Uri.parse("ws://$url/ws"),
          headers: {"Authorization": "Bearer $accessToken"}
          // headers: {'Connection': 'upgrade', 'Upgrade': 'websocket'},
          );

      await _channel.ready;

      await _streamController.addStream(_channel.stream);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> disconnect() async {
    try {
      await _channel.sink.close();
      await _streamController.close();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<MessageModel> getStream() {
    try {
      //return _channel.stream.map((event) );
      return _streamController.stream.map((event) {
        final json = jsonDecode(event) as Map<String, dynamic>;
        log(json.toString(), name: "stream-error");

        return MessageModel.fromJson(json);
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
