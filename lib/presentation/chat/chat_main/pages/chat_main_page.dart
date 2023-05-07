import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/segment_button_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/app_bar/m_home_app_bar.dart';

class ChatMainPage extends StatelessWidget {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.chat,
      ),
      body: Column(
        children: const <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 8,
                    ),
                    child: SegmentButtonChat(),
                  ),
                ),
                ListChatRoom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
