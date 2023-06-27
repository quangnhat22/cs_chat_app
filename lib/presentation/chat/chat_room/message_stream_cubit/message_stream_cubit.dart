import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> started(String id) async {
    try {
      await _messageUseCase.connectSocket(id);

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
      {required String type, required String message, String? optional}) async {
    try {
      final id = const Uuid().v4();
      emit(MessageSendInProgress(
        id: id,
        message: message,
        type: type,
      ));

      await _messageUseCase.sendMessage(
        type: type,
        message: message,
        option: id,
      );

      emit(const MessageSendSuccess());
    } catch (e) {
      emit(MessageSendFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> close() async {
    await _messageUseCase.disconnectSocket();
    _subNewMessageStream.cancel();
    return super.close();
  }
}
