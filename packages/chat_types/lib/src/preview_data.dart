part of 'base.dart';

@freezed
class PreviewData  with _$PreviewData {
  const factory PreviewData({
    String? description,
    PreviewDataImage? image,
    String? link,
    String? title,
  })  = _PreviewData;

  factory PreviewData.fromJson(Map<String, Object?> json) =>
      _$PreviewDataFromJson(json);
}