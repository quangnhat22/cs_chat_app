import 'package:audioplayers/audioplayers.dart';
import 'package:chatapp/core/utils/media_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../message_item.dart';

class AudioMessage extends IMessageItem {
  const AudioMessage({
    super.key,
    required this.content,
    this.isMe = false,
  });

  final String content;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.6.sw),
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: AudioMessageItem(
          url: content,
          isMe: isMe,
        ),
      ),
    );
  }
}

class AudioMessageItem extends StatefulWidget {
  const AudioMessageItem({
    super.key,
    required this.url,
    this.isMe = false,
  });

  final String url;
  final bool isMe;

  @override
  State<AudioMessageItem> createState() => _AudioMessageItemState();
}

class _AudioMessageItemState extends State<AudioMessageItem> {
  final audioPlayer = AudioPlayer();
  bool isPlay = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  Future _setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.stop);

    audioPlayer.setSourceUrl(widget.url);
  }

  @override
  void initState() {
    super.initState();

    _setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          isPlay = state == PlayerState.playing;
        });
      }
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      if (mounted) {
        setState(() {
          duration = newDuration;
        });
      }
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      if (mounted) {
        setState(() {
          position = newPosition;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () async {
                    if (!isPlay) {
                      // await audioPlayer.play(UrlSource(widget.url));
                      await audioPlayer.resume();
                    } else {
                      await audioPlayer.pause();
                    }
                  },
                  icon: Icon(
                    isPlay ? Icons.pause : Icons.play_arrow,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  iconSize: 24,
                ),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 160.w,
                  child: Slider(
                    min: 0.0,
                    inactiveColor: Theme.of(context).colorScheme.background,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      //await audioPlayer.resume();
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(AppMediaDuration.convertDurationToString(position)),
                SizedBox(
                  width: 48.w,
                ),
                Text(AppMediaDuration.convertDurationToString(duration)),
              ],
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
}
