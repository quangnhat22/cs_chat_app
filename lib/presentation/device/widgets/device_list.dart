part of device_administration_lib;

class DeviceList extends StatelessWidget {
  DeviceList({super.key});

  final devices = ['Device name 1', 'Device name 2'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(
              text: TextSpan(
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                TextSpan(
                  text: devices[index],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: AppLocalizations.of(context)!.want_to_friend_with_you,
                  style: const TextStyle(fontWeight: FontWeight.w300),
                )
              ])),
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.smartphone,
              color: Theme.of(context).colorScheme.primaryContainer)),
          tileColor: Theme.of(context).colorScheme.surfaceVariant,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        );
      },
      itemCount: devices.length,
    );
  }
}
