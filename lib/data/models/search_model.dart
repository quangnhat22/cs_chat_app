import 'package:chatapp/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'chat_room_model.dart';

part 'search_model.freezed.dart';
part 'search_model.g.dart';

@freezed
class SearchModel with _$SearchModel {
  SearchModel._();

  factory SearchModel({
    List<UserModel>? friends,
    List<ChatRoomModel>? groups,
    List<ChatRoomModel>? messages,
  }) = _SearchModel;

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);
}
