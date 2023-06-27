import 'package:chatapp/common/widgets/stateless/app_bar/m_page_app_bar.dart';
import 'package:chatapp/common/widgets/stateless/message/message_item.dart';
import 'package:chatapp/common/widgets/stateless/message/message_item/image_message_item.dart';
import 'package:chatapp/core/utils/media_duration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoMessageItem extends IMessageItem {
  const VideoMessageItem({
    super.key,
    this.content,
    this.videoUrl,
    this.isMe = false,
    this.isBorder = true,
  });

  final String? content;
  final String? videoUrl;
  final bool isMe;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        constraints: BoxConstraints(maxWidth: 0.6.sw),
        decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: content != null
            ? VideoPlayerView(
                thumbnailUrl: content!,
                videoUrl: videoUrl,
                isMe: isMe,
                isBorder: isBorder,
              )
            : Container(),
      ),
    );
  }
}

class VideoPlayerView extends StatelessWidget {
  final bool isMe;
  final String? videoUrl;
  final String? thumbnailUrl;
  final bool isBorder;

  const VideoPlayerView({
    super.key,
    required this.isMe,
    this.videoUrl,
    this.thumbnailUrl,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageMessageItem(
          content: thumbnailUrl,
          isMe: isMe,
          isBorder: isBorder,
          onTap: () {},
        ),
        if (videoUrl != null)
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 0,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.5),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => VideoPlayPage(
                        url: videoUrl!,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.play_arrow),
              ),
            ),
          ),
      ],
    );
  }
}

class VideoPlayPage extends StatefulWidget {
  const VideoPlayPage({super.key, required this.url});

  static String namePage = "video-play-page";

  final String url;

  @override
  State<VideoPlayPage> createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController _controller;
  bool _isPlay = false;
  bool _isShow = true;

  Future<void> _seekTo(
      {required Duration position, bool isBack = false}) async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final currentPos = await _controller.position;

    if (currentPos == null) return;

    final newPos = (isBack) ? (currentPos - position) : (currentPos + position);

    if (isBack && newPos < _controller.value.duration) {
      _controller.seekTo(const Duration(seconds: 0));
      setState(() {});
    }

    if (!isBack && newPos > _controller.value.duration) {
      _controller.seekTo(_controller.value.duration);
      setState(() {});
    }

    await _controller.seekTo(newPos);
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..addListener(() {
        setState(() {});
      })
      ..initialize().then((_) {
        setState(() {});
        _controller.addListener(() {
          if (_controller.value.isPlaying) {
            setState(() {
              _isPlay = true;
            });
          }
          if (!_controller.value.isPlaying) {
            setState(() {
              _isPlay = false;
            });
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MPageAppBar(title: AppLocalizations.of(context)!.video),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShow = !_isShow;
          });
        },
        child: Stack(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Loading....",
                          )
                        ],
                      ),
                    ),
            ),
            _controller.value.isInitialized
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: _isShow
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.black.withOpacity(0.7),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                    horizontal: 20.0,
                                  ),
                                  child: Column(
                                    children: [
                                      VideoProgressIndicator(
                                        _controller,
                                        allowScrubbing: true,
                                        colors: VideoProgressColors(
                                          playedColor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ValueListenableBuilder(
                                            valueListenable: _controller,
                                            builder: (context,
                                                VideoPlayerValue value, child) {
                                              return Text(AppMediaDuration
                                                  .convertDurationToString(
                                                      value.position));
                                            },
                                          ),
                                          ValueListenableBuilder(
                                            valueListenable: _controller,
                                            builder: (context,
                                                VideoPlayerValue value, child) {
                                              return Text(AppMediaDuration
                                                  .convertDurationToString(
                                                      _controller
                                                          .value.duration));
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () => _seekTo(
                                          position: const Duration(seconds: 15),
                                          isBack: true),
                                      icon:
                                          const Icon(Icons.restart_alt_rounded),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });
                                      },
                                      icon: Icon(
                                        _isPlay
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => _seekTo(
                                          position:
                                              const Duration(seconds: 15)),
                                      icon: const Icon(
                                          Icons.not_started_outlined),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
