import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/stateless/circle_avatar/custom_avatar_image.dart';

class TitleChatRoom extends StatelessWidget {
  const TitleChatRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
            getChatRoomInfoSuccess:
                (_, __, ___, ____, chatRoomName, chatRoomAvatar, _____) {
              return Row(
                children: <Widget>[
                  CustomAvatarImage(
                    urlImage: chatRoomAvatar,
                    widthImage: 40,
                    heightImage: 40,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          chatRoomName ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        // Text(
                        //   'Online',
                        //   maxLines: 1,
                        //   overflow: TextOverflow.ellipsis,
                        //   softWrap: true,
                        //   style: TextStyle(
                        //       fontSize: 12, fontWeight: FontWeight.w300),
                        // ),
                      ],
                    ),
                  )
                ],
              );
            },
            orElse: () => Container());
      },
    );
  }
}
