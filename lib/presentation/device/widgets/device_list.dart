part of device_administration_lib;

class DeviceList extends StatelessWidget {
  DeviceList({super.key});

  final devices = ['Device name 1', 'Device name 2'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 4.0),
          child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(
                  Icons.smartphone,
                  color: Theme.of(context).colorScheme.primaryContainer)),
              title: Text(devices[index]),
              tileColor: Theme.of(context).colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            ),
        );
      },
      itemCount: devices.length,
    );
  }
}
