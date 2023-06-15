import 'package:flutter/material.dart';

class GroupDetailsInfo extends StatelessWidget {
  GroupDetailsInfo({super.key});

  final details = [
    "Thêm thành viên",
    "Bật thông báo",
    "Xem thành viên",
    "File, phương tiện",
    "Rời nhóm"
  ];

  final icons = [
    Icons.add,
    Icons.notifications_active,
    Icons.people,
    Icons.attach_file,
    Icons.exit_to_app,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                icons[index],
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            title: Text(details[index]),
            // tileColor: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
          ),
        );
      },
      itemCount: details.length,
    );
  }
}
