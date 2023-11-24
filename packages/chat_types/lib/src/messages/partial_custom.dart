part of '../base.dart';

@freezed
class PartialCustom with _$PartialCustom {
  const factory PartialCustom({
    Map<String, dynamic>? metadata,
    Message? repliedMessage,
  })  = _PartialCustom;

  factory PartialCustom.fromJson(Map<String, Object?> json) =>
      _$PartialCustomFromJson(json);
}