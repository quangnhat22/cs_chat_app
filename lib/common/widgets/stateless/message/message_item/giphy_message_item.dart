import 'dart:convert';

import 'package:chatapp/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:giphy_get/giphy_get.dart';

import '../message_item.dart';

class GiphyMessageItem extends IMessageItem {
  const GiphyMessageItem({
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
    return GiphyGetWrapper(
      giphy_api_key: AppConfig.giphyKey,
      // Builder with Stream<GiphyGif> and Instance of GiphyGetWrapper
      builder: (stream, giphyGetWrapper) => StreamBuilder<GiphyGif>(
        stream: stream,
        builder: (context, _) {
          return GiphyGifWidget(
            imageAlignment: Alignment.center,
            gif: GiphyGif.fromJson(jsonDecode(content!)),
            giphyGetWrapper: giphyGetWrapper,
            borderRadius: BorderRadius.circular(16),
            showGiphyLabel: false,
          );
        },
      ),
    );
  }
}
