import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ListBottomNavigation extends StatelessWidget {
  const ListBottomNavigation({
    Key? key,
    required this.handleOnTab,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) handleOnTab;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.chat_outlined),
          selectedIcon: const Icon(Icons.chat),
          label: AppLocalizations.of(context)!.chat,
        ),
        NavigationDestination(
          icon: const Icon(Icons.search_outlined),
          selectedIcon: const Icon(Icons.search),
          label: AppLocalizations.of(context)!.search,
        ),
        NavigationDestination(
          icon: const Icon(Icons.groups_outlined),
          selectedIcon: const Icon(Icons.groups),
          label: AppLocalizations.of(context)!.contact,
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings_outlined),
          selectedIcon: const Icon(Icons.settings),
          label: AppLocalizations.of(context)!.setting,
        ),
      ],
      onDestinationSelected: handleOnTab,
      selectedIndex: currentIndex,
    );
  }
}
