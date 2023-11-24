part of '../base.dart';


@freezed
class PartialAudio with _$PartialAudio {
  const factory PartialAudio({
    required Duration duration,
    Map<String, dynamic>? metadata,
    String? mimeType,
    required String name,
    Message? repliedMessage,
    required num size,
    required String uri,
    List<double>? waveForm,
  })  = _PartialAudio;

  factory PartialAudio.fromJson(Map<String, Object?> json) =>
      _$PartialAudioFromJson(json);
}