import 'package:chatapp/core/utils/date_time_format.dart';
import 'package:chatapp/domain/entities/device_entity.dart';
import 'package:flutter/material.dart';

class DeviceListItem extends StatelessWidget {
  const DeviceListItem({super.key, required this.deviceItem});

  final DeviceEntity deviceItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.smartphone,
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
          ),
          title: Text(deviceItem.name ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 8,
              ),
              Text(
                  'Last time using: ${AppDateTimeFormat.formatDDMMYYYY(deviceItem.updatedAt)}')
            ],
          ),
          tileColor: Theme.of(context).colorScheme.surfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16)),
    );
  }
}
