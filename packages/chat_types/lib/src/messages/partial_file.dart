part of '../base.dart';

@freezed
class PartialFile with _$PartialFile {
  const factory PartialFile({
    Map<String, dynamic>? metadata,
    String? mimeType,
    required String name,
    Message? repliedMessage,
    required num size,
    required String uri,
  })  = _PartialFile;

  factory PartialFile.fromJson(Map<String, Object?> json) =>
      _$PartialFileFromJson(json);
}