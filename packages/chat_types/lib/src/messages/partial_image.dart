part of '../base.dart';

@freezed
class PartialImage with _$PartialImage {
  const factory PartialImage({
    double? height,
    Map<String, dynamic>? metadata,
    required String name,
    Message? repliedMessage,
    required num size,
    required String uri,
    double? width,
  })  = _PartialImage;

  factory PartialImage.fromJson(Map<String, Object?> json) =>
      _$PartialImageFromJson(json);
}