import 'package:chatapp/common/widgets/stateless/app_bar/m_home_app_bar.dart';
import 'package:chatapp/presentation/chat/chat_main/widgets/list_chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatPlaceHolder extends StatefulWidget {
  const ChatPlaceHolder({Key? key}) : super(key: key);

  @override
  State<ChatPlaceHolder> createState() => _ChatPlaceHolderState();
}

class _ChatPlaceHolderState extends State<ChatPlaceHolder> {
  final List<String> _tabName = ['All', 'Message', 'Group'];
  final List<Tab> _tabs = const <Tab>[
    Tab(
      child: ListChatRoom(),
    ),
    Tab(
      child: ListChatRoom(),
    ),
    Tab(
      child: ListChatRoom(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.chat,
          bottomWidget: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50), // Creates border
              color: Theme.of(context).colorScheme.primary,
            ),
            indicatorPadding: const EdgeInsets.all(8),
            labelColor: Colors.white,
            tabs: List<Widget>.generate(
              _tabName.length,
              (index) {
                return Tab(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        _tabName[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 100,
              ),
              Image.asset(
                'assets/images/ChatPlaceholder.png',
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
