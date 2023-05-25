import 'package:chatapp/presentation/chat/chat_main/pages/chat_main_page.dart';
import 'package:chatapp/presentation/friends/friends_dash_board/friends_dash_board.dart';
import 'package:chatapp/presentation/group/groups_dash_board/groups_dash_board.dart';
import 'package:chatapp/presentation/home/widgets/list_bottom_navigation.dart';
import 'package:chatapp/presentation/notification/page/notification_page.dart';
import 'package:chatapp/presentation/setting/setting_main/setting_main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;

  final List<Widget> _pages = const <Widget>[
    ChatMainPage(),
    FriendsDashBoardPage(),
    //group
    GroupsDashBoardPage(),
    NotificationPage(),
    //notifications
    //SearchPage(),
    SettingMainPage(),
  ];

  void _onTap(int tabIndex) {
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTabIndex,
        children: _pages,
      ),
      bottomNavigationBar: ListBottomNavigation(
        handleOnTab: _onTap,
        currentIndex: _currentTabIndex,
      ),
    );
  }
}
