part of 'base.dart';

@freezed
class PreviewDataImage  with _$PreviewDataImage {
  const factory PreviewDataImage({
    required double height,
    required String url,
    required num width,
  })  = _PreviewDataImage;

  factory PreviewDataImage.fromJson(Map<String, Object?> json) =>
      _$PreviewDataImageFromJson(json);
}
