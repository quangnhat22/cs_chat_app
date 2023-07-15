part of device_administration_lib;

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListDeviceBloc, ListDeviceState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          inSuccess: (listDevice) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return DeviceListItem(
                    deviceItem: listDevice[index],
                  );
                },
                childCount: listDevice.length,
              ),
            );
          },
          inProgress: () {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          orElse: () {
            return SliverToBoxAdapter(
              child: Center(
                child: Text(
                    AppLocalizations.of(context)!.something_wrong_try_again),
              ),
            );
          },
        );
      },
    );
  }
}
