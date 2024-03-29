part of device_administration_lib;

class DeviceMainPage extends StatelessWidget {
  const DeviceMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ListDeviceBloc>()..add(const ListDeviceEvent.started()),
      child: const DeviceMainPageView(),
    );
  }
}

class DeviceMainPageView extends StatelessWidget {
  const DeviceMainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.devices,
      ),
      body: const CustomScrollView(
        slivers: <Widget>[
          DeviceList(),
        ],
      ),
    );
  }
}
