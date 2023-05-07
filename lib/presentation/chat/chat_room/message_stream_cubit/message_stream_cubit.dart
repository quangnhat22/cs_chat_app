import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/message_entity.dart';
import '../../../../domain/modules/message/message_usecase.dart';

part 'message_stream_cubit.freezed.dart';
part 'message_stream_state.dart';

@Injectable()
class MessageStreamCubit extends Cubit<MessageStreamState> {
  MessageStreamCubit({
    required MessageUseCase messageUC,
  })  : _messageUseCase = messageUC,
        super(const MessageStreamState.initial());

  final MessageUseCase _messageUseCase;
  late final StreamSubscription<MessageEntity> _subNewMessageStream;

  Future<void> started() async {
    try {
      await _messageUseCase.connectSocket();

      //register a subscription new message stream from Socket
      _subNewMessageStream = _messageUseCase.getNewMessage().listen((message) {
        log(message.toString(), name: "new message");
        emit(MessageReceivedSuccess(newMessage: message));
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> sendMessage(
      String type, String message, String receiverUserId) async {
    try {
      await _messageUseCase.sendMessage(type, message, receiverUserId);
      emit(const MessageSendSuccess());
    } catch (e) {
      emit(MessageSendFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> close() {
    _subNewMessageStream.cancel();
    _messageUseCase.disconnectSocket();
    return super.close();
  }
}
