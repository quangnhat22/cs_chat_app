import 'package:chatapp/common/widgets/stateless/app_bar/m_home_app_bar.dart';
import 'package:chatapp/presentation/contacts/contacts_main/pages/add_new_friend.dart';
import 'package:chatapp/presentation/contacts/contacts_main/pages/contact_page.dart';
import 'package:chatapp/presentation/contacts/contacts_main/pages/friend_request_page.dart';
import 'package:chatapp/presentation/contacts/contacts_main/widgets/list_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactsMainPage extends StatefulWidget {
  const ContactsMainPage({super.key});

  @override
  State<ContactsMainPage> createState() => _ContactsMainPageState();
}

class _ContactsMainPageState extends State<ContactsMainPage> {
  final List<String> _tabName = ['Friend', 'Group'];
  final List<Tab> _tabs = const <Tab>[
    Tab(
      child: ListContact(),
    ),
    Tab(
      child: ListContact(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: MHomeAppBar(
          title: AppLocalizations.of(context)!.contact,
          bottomWidget: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.primary,
            ),
            indicatorPadding: const EdgeInsets.all(8),
            labelColor: Colors.white,
            tabs: List<Widget>.generate(_tabName.length, (index) {
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
            }),
          ),
        ),
        body: const AddNewFriend(),
      ),
    );
  }
}
