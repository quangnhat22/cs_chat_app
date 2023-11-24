part of '../base.dart';

@freezed
class PartialVideo with _$PartialVideo {
  const factory PartialVideo({
    double? height,
    Map<String, dynamic>? metadata,
    required String name,
    Message? repliedMessage,
    required num size,
    required String uri,
    double? width,
  })  = _PartialVideo;

  factory PartialVideo.fromJson(Map<String, Object?> json) =>
      _$PartialVideoFromJson(json);
}