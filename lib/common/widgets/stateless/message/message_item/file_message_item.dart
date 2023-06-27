import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:chatapp/core/utils/assets_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

import '../message_item.dart';

class FileMessageItem extends IMessageItem {
  const FileMessageItem({
    super.key,
    this.content,
    this.isMe = false,
    this.createdAt,
  });

  final String? content;
  final bool isMe;
  final DateTime? createdAt;

  @override
  Widget build(BuildContext context) {
    return FileItem(
      key: key,
      isMe: isMe,
      url: content,
      createAt: createdAt,
    );
  }
}

class FileItem extends StatefulWidget {
  const FileItem({
    super.key,
    this.url,
    required this.isMe,
    this.createAt,
  });

  final String? url;
  final bool isMe;
  final DateTime? createAt;

  @override
  State<FileItem> createState() => _FileItemState();
}

class _FileItemState extends State<FileItem> {
  final ReceivePort _port = ReceivePort();
  // bool _isExist = false;
  String _fileName = "";
  int _fileSize = 0;

  Future<void> _getFileInfo(BuildContext context) async {
    try {
      if (widget.url == null || !context.mounted) return;
      final ref = FirebaseStorage.instance.refFromURL(widget.url!);
      _fileName = ref.name;
      if (_fileSize == 0) {
        ref.getMetadata().then((metaData) {
          if (context.mounted) {
            setState(() {
              _fileSize = metaData.size ?? 0;
            });
          }
        });
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> _checkFileExistInStorage(BuildContext context) async {
    String savePath = '/storage/emulated/0/Download/$_fileName';
    final isExist = await File(savePath).exists();
    return isExist;
    // if (context.mounted) {
    //   setState(() {
    //     _isExist = isExist;
    //   });
    // }
  }

  Future<String?> _getSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      try {
        externalStorageDirPath = await AndroidPathProvider.downloadsPath;
      } catch (err, st) {
        log('failed to get downloads path: $err, $st');

        final directory = await getExternalStorageDirectory();
        externalStorageDirPath = directory?.path;
      }
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    }
    return externalStorageDirPath;
  }

  Future<void> _handleDownload(String? url) async {
    if (url == null) return;
    final localPath = (await _getSavedDir())!;
    await FlutterDownloader.enqueue(
      url: url,
      fileName: _fileName,
      savedDir: localPath,
      showNotification: true,
      openFileFromNotification: true,
      saveInPublicStorage: true,
    );
  }

  void _openFile(BuildContext ctx, String? url) async {
    try {
      final isExist = await _checkFileExistInStorage(ctx);
      if (!isExist) {
        await _handleDownload(url);
      }
      String savePath = '/storage/emulated/0/Download/$_fileName';
      await OpenFile.open(savePath);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    (() async {
      if (mounted) {
        await _getFileInfo(context);
      }

      // if (mounted) {
      //   await _checkFileExistInStorage(context);
      // }
    })();

    AssetsUtils.registerPort(_port.sendPort);

    _port.listen((dynamic data) async {
      setState(() {});
    });

    FlutterDownloader.registerCallback(AssetsUtils.sendPort);
  }

  @override
  void dispose() {
    AssetsUtils.removeSendPort;
    _port.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.6.sw),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: widget.isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(context).colorScheme.background,
              child: const Icon(Icons.file_copy_outlined),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _fileName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    softWrap: true,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    AssetsUtils.getFileSizeString(bytes: _fileSize),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      height: 1.2,
                      //fontWeight: FontWeight.w300,
                    ),
                    softWrap: true,
                    maxLines: 3,
                  ),
                  // !_isExist
                  //     ? TextButton(
                  //         onPressed: () async => _handleDownload(widget.url),
                  //         child: const Text("Download"),
                  //       )
                  TextButton(
                    onPressed: () => _openFile(context, widget.url),
                    child: const Text("Open"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
