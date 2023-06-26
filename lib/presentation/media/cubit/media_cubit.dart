import 'package:chatapp/domain/entities/message_entity.dart';
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'media_state.dart';
part 'media_cubit.freezed.dart';

@Injectable()
class MediaCubit extends Cubit<MediaState> {
  MediaCubit(this._chatRoomUseCase) : super(const MediaState.initial());

  final ChatRoomUseCase _chatRoomUseCase;

  Future<void> fetchListMessageMedia({required String chatRoomId}) async {
    try {
      emit(const GetListMediaInProgress());
      final listMessage = await _chatRoomUseCase.getListMessage(
          chatRoomId: chatRoomId, limit: 100);

      final listMessagePhoto =
          listMessage.where((message) => message.type == "image").toList();

      final listMessageVideo =
          listMessage.where((message) => message.type == "video").toList();

      final listMessageFile =
          listMessage.where((message) => message.type == "file").toList();

      emit(GetListMediaInSuccess(
        listPhotos: listMessagePhoto,
        listVideo: listMessageVideo,
        listFile: listMessageFile,
      ));
    } catch (e) {
      emit(GetListMediaInFailure(message: e.toString()));
      throw Exception(e.toString());
    }
  }
}
