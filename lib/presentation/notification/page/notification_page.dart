import 'package:chatapp/common/widgets/stateless/app_bar/m_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(title: AppLocalizations.of(context)!.notifications),
    );
  }
}
