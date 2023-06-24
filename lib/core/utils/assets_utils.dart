import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

class AssetsUtils {
  AssetsUtils._();

  static String downloaderSendPort = "downloader_send_port";

  static void registerPort(SendPort sendPort) {
    IsolateNameServer.registerPortWithName(sendPort, 'downloader_send_port');
  }

  @pragma('vm:entry-point')
  static void sendPort(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName(downloaderSendPort);
    send!.send([id, status, progress]);
  }

  static void removeSendPort(String id, int status, int progress) {
    IsolateNameServer.removePortNameMapping(downloaderSendPort);
  }

  static String getFileSizeString({required int bytes, int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    if (bytes == 0) return '0${suffixes[0]}';
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
