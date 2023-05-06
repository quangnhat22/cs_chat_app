import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/segment_button_chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/app_bar/m_home_app_bar.dart';
import '../../../../core/config/app_assets.dart';
import '../../../../core/config/app_text_style.dart';
import '../../../../core/config/app_theme.dart';

class ChatMainPage extends StatefulWidget {
  const ChatMainPage({Key? key}) : super(key: key);

  @override
  State<ChatMainPage> createState() => _ChatMainPageState();
}

class _ChatMainPageState extends State<ChatMainPage> {
  // final List<String> _tabName = ['All', 'Message', 'Group'];
  // final List<Tab> _tabs = const <Tab>[
  //   Tab(
  //     child: ListChatRoom(),
  //   ),
  //   Tab(
  //     child: ListChatRoom(),
  //   ),
  //   Tab(
  //     child: ListChatRoom(),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //   length: _tabs.length,
    //   child: Scaffold(
    //     appBar: MHomeAppBar(
    //       title: AppLocalizations.of(context)!.chat,
    //       bottomWidget: TabBar(
    //         indicatorSize: TabBarIndicatorSize.tab,
    //         dividerColor: Colors.transparent,
    //         indicator: BoxDecoration(
    //           borderRadius: BorderRadius.circular(50), // Creates border
    //           color: Theme.of(context).colorScheme.primary,
    //         ),
    //         indicatorPadding: const EdgeInsets.all(8),
    //         labelColor: Colors.white,
    //         tabs: List<Widget>.generate(
    //           _tabName.length,
    //           (index) {
    //             return Tab(
    //               child: Container(
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(50),
    //                 ),
    //                 child: Align(
    //                   alignment: Alignment.center,
    //                   child: Text(
    //                     _tabName[index],
    //                   ),
    //                 ),
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ),
    //     body: const ChatPage(),
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
