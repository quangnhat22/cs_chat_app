import 'dart:developer';
import 'dart:ui';

import 'package:chatapp/common/widgets/stateless/button/float_action_stadium_button.dart';
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_message.dart';

class ListMessageContainer extends StatefulWidget {
  const ListMessageContainer({super.key, required this.type});

  final String type;

  @override
  State<ListMessageContainer> createState() => _ListMessageContainerState();
}

class _ListMessageContainerState extends State<ListMessageContainer> {
  final ScrollController _scrollController = ScrollController();
  bool _isShowMoveToBottom = false;
  final widthScreen = MediaQueryData.fromWindow(window).size;
  late Offset screenOffset =
      Offset(widthScreen.width / 2, widthScreen.height / 2);

  void _onTapScrollBottom(BuildContext ctx) {
    final chatRoomState = ctx.read<ChatRoomBloc>().state;
    if (chatRoomState is ChatRoomInfoSuccess) {
      //handle when searching
      final isLatestMessage = chatRoomState.isLatestMessage;
      final isSearching = chatRoomState.searchMessageId != null;
      if (!isLatestMessage && isSearching) {
        ctx.read<ChatRoomBloc>().add(const ChatRoomRefreshed());
      }
    }
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (context.mounted) {
        if ((_scrollController.offset > screenOffset.dy &&
                !_isShowMoveToBottom) ||
            (_scrollController.offset <= screenOffset.dy &&
                _isShowMoveToBottom)) {
          setState(() {
            _isShowMoveToBottom = !_isShowMoveToBottom;
          });
        }

        if (_scrollController.position.atEdge) {
          bool isTop = _scrollController.position.pixels == 0;

          if (isTop) {
            context
                .read<ChatRoomBloc>()
                .add(const ChatRoomNewMessageBottomLoaded());
            log('At top');
          } else {
            log('At the bottom');
          }
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomBloc, ChatRoomState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Stack(
          children: <Widget>[
            CustomScrollView(
              reverse: true,
              controller: _scrollController,
              slivers: const <Widget>[
                ListMessage(),
              ],
            ),
            if (_isShowMoveToBottom)
              Positioned(
                right: 10,
                bottom: 10,
                child: FloatingActionStadiumButton(
                  onPressed: () => _onTapScrollBottom(context),
                  heroTag: null,
                  iconData: Icons.arrow_downward_outlined,
                  elevation: 10,
                ),
              ),
          ],
        );
      },
    );
  }
}
