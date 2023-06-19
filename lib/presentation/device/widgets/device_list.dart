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
          margin: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 8.0, top: 4.0),
          child: ListTile(
            leading: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.smartphone,
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
    // return BlocBuilder<ListDeviceBloc, ListDeviceState>(
    //     buildWhen: (previous, current) => previous != current,
    //     builder: (context, state) {
    //       return state.maybeWhen(
    //         inSuccess: (listDevice) {
    //           return SliverList(
    //             delegate: SliverChildBuilderDelegate(
    //               (BuildContext context, int index) {
    //                 if (index.isEven) {
    //                   return DeviceListItem(
    //                     deviceItem: listDevice[index],
    //                   );
    //                 }
    //                 return const DividerSpaceLeft();
    //               },
    //               semanticIndexCallback: (Widget widget, int localIndex) {
    //                 if (localIndex.isEven) {
    //                   return localIndex ~/ 2;
    //                 }
    //                 return null;
    //               },
    //               childCount: listDevice.length,
    //             ),
    //           );
    //         },
    //         inProgress: () {
    //           return const SliverToBoxAdapter(
    //             child: Center(
    //               child: CircularProgressIndicator(),
    //             ),
    //           );
    //         },
    //         orElse: () {
    //           return SliverToBoxAdapter(
    //             child: Center(
    //               child: Text(
    //                   AppLocalizations.of(context)!.something_wrong_try_again),
    //             ),
    //           );
    //         },
    //       );
    //     });
  }
}
