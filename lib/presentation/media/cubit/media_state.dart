part of 'media_cubit.dart';

@freezed
class MediaState with _$MediaState {
  const factory MediaState.initial({
    List<MessageEntity>? listPhotos,
    List<MessageEntity>? listVideo,
    List<MessageEntity>? listFile,
    List<MessageEntity>? listLink,
  }) = _Initial;
  const factory MediaState.getListMessageInProgress() = GetListMediaInProgress;
  const factory MediaState.getListMessageSuccess({
    List<MessageEntity>? listPhotos,
    List<MessageEntity>? listVideo,
    List<MessageEntity>? listFile,
    List<MessageEntity>? listLink,
  }) = GetListMediaInSuccess;
  const factory MediaState.getListMessageFailure({String? message}) =
      GetListMediaInFailure;
}
