import 'package:chatapp/core/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceSoundBottomSheet extends StatefulWidget {
  const VoiceSoundBottomSheet({super.key});

  @override
  State<VoiceSoundBottomSheet> createState() => _VoiceSoundBottomSheetState();
}

class _VoiceSoundBottomSheetState extends State<VoiceSoundBottomSheet> {
  final _recorder = FlutterSoundRecorder();
  bool _isRecordeReady = false;
  bool _isSentReady = false;
  String? pathFile;

  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted && context.mounted) {
      //TODO: support vi en
      SnackBarApp.showSnackBar(
          context, "Cannot record message", TypesSnackBar.error);
      return;
    }

    await _recorder.openRecorder();
    setState(() {
      _isRecordeReady = true;
    });
    _recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
  }

  Future record() async {
    if (!_isRecordeReady) return;
    setState(() {
      _isSentReady = false;
    });
    await _recorder.startRecorder(toFile: "audio");
  }

  Future stop() async {
    if (!_isRecordeReady) return;
    final path = await _recorder.stopRecorder();
    setState(() {
      _isRecordeReady = true;
      _isSentReady = true;
      pathFile = path;
    });
  }

  void _handleSendRecord(BuildContext ctx) {
    Navigator.of(ctx).pop(pathFile);
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 32,
          left: 32,
          right: 32,
          bottom: MediaQuery.of(context).viewInsets.bottom + 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StreamBuilder<RecordingDisposition>(
              stream: _recorder.onProgress,
              builder: (context, snapshot) {
                final duration =
                    snapshot.hasData ? snapshot.data!.duration : Duration.zero;

                String twoDigits(int n) => n.toString().padLeft(2, "0");

                final twoDigitsMinutes =
                    twoDigits(duration.inMinutes.remainder(60));

                final twoDigitsSeconds =
                    twoDigits(duration.inSeconds.remainder(60));

                return Text(
                  '$twoDigitsMinutes : $twoDigitsSeconds s',
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w500,
                  ),
                );
              }),
          SizedBox(
            height: 16.h,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      _recorder.isRecording ? Icons.stop : Icons.mic,
                      size: 36.sp,
                    ),
                  ),
                  onPressed: () async {
                    if (_recorder.isRecording) {
                      await stop();
                    } else {
                      await record();
                    }
                    setState(() {});
                  },
                ),
                if (_isSentReady)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.upload,
                        size: 36.sp,
                      ),
                    ),
                    onPressed: () => _handleSendRecord(context),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
