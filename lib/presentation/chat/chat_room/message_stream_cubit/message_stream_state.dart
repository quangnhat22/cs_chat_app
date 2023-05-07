part of 'message_stream_cubit.dart';

@freezed
class MessageStreamState with _$MessageStreamState {
  const factory MessageStreamState.initial() = _Initial;

  const factory MessageStreamState.sendMessageInProgress() =
      MessageSendInProgress;

  const factory MessageStreamState.sendMessageSuccess() = MessageSendSuccess;

  const factory MessageStreamState.sendMessageFailure({
    required String message,
  }) = MessageSendFailure;

  const factory MessageStreamState.receivedNewMessageSuccess({
    required MessageEntity newMessage,
  }) = MessageReceivedSuccess;
}
