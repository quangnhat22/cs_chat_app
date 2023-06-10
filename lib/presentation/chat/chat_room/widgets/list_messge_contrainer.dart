import 'dart:ui';

import 'package:chatapp/common/widgets/stateless/button/float_action_stadium_button.dart';
import 'package:flutter/material.dart';

import 'list_message.dart';

class ListMessageContainer extends StatefulWidget {
  const ListMessageContainer({super.key});

  @override
  State<ListMessageContainer> createState() => _ListMessageContainerState();
}

class _ListMessageContainerState extends State<ListMessageContainer> {
  final ScrollController _scrollController = ScrollController();

  bool _isShowMoveToBottom = false;

  final widthScreen = MediaQueryData.fromWindow(window).size;

  late Offset screenOffset =
      Offset(widthScreen.width / 2, widthScreen.height / 2);

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
            print('At the top');
          } else {
            print('At the bottom');
          }
        }
      }
    });

    super.initState();
  }

  void _onTapScrollBottom() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: _onTapScrollBottom,
              heroTag: null,
              iconData: Icons.arrow_downward_outlined,
              elevation: 10,
            ),
          ),
      ],
    );
  }
}
