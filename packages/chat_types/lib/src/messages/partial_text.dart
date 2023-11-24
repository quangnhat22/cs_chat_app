part of '../base.dart';

@freezed
class PartialText with _$PartialText {
  const factory PartialText({
    Map<String, dynamic>? metadata,
    PreviewData? previewData,
    Message? repliedMessage,
    required String text,
  })  = _PartialText;

  factory PartialText.fromJson(Map<String, Object?> json) =>
      _$PartialTextFromJson(json);
}