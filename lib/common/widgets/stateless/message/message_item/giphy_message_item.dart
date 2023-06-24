import 'dart:convert';

import 'package:chatapp/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 1,
          ),
        ),
        child: GiphyGetWrapper(
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
        ),
      ),
    );
  }
}
