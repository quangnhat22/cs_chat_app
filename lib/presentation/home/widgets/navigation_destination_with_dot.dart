import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationDestinationWithDot extends StatelessWidget {
  const NavigationDestinationWithDot({
    super.key,
    required this.icon,
    required this.iconSelected,
    required this.label,
  });

  final IconData icon;
  final IconData iconSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: const Badge(
        label: Text('12'),
        child: Icon(Icons.call),
      ),
      selectedIcon: const Icon(Icons.groups),
      label: AppLocalizations.of(context)!.groups,
    );
  }
}
