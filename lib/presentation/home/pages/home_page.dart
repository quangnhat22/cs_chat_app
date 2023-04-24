import 'package:chatapp/presentation/chat/chat_main/pages/chat_main_page.dart';
import 'package:chatapp/presentation/contacts/contacts_main/pages/contacts_main.dart';
import 'package:chatapp/presentation/home/widgets/list_bottom_navigation.dart';
import 'package:chatapp/presentation/search/pages/search_page.dart';
import 'package:chatapp/presentation/setting/setting_main/pages/setting_main_page.dart';
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
    SearchPage(),
    ContactsMainPage(),
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
