part of device_administration_lib;

class DeviceMainPage extends StatelessWidget {
  const DeviceMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 20, 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatBackButton(Theme.of(context).colorScheme.surfaceTint,
                      Theme.of(context).colorScheme.onPrimary),
                  SmallElevatedButton(
                      "Done", () {}, Theme.of(context).colorScheme.surfaceTint),
                ]),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 40,
                    ),
                    child: SegmentButtonDevice(),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  DeviceList(),
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class DeviceMainPage extends StatelessWidget {
//   const DeviceMainPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           getIt<ListDeviceBloc>()..add(const ListDeviceEvent.started()),
//       child: const DeviceMainPageView(),
//     );
//   }
// }

// class DeviceMainPageView extends StatelessWidget {
//   const DeviceMainPageView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 40, 20, 30),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   FloatBackButton(Theme.of(context).colorScheme.surfaceTint,
//                       Theme.of(context).colorScheme.onPrimary),
//                   SmallElevatedButton(
//                       "Done", () {}, Theme.of(context).colorScheme.surfaceTint),
//                 ]),
//           ),
//           Expanded(
//             child: CustomScrollView(
//               slivers: <Widget>[
//                 const SliverToBoxAdapter(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 18,
//                       vertical: 40,
//                     ),
//                     child: SegmentButtonDevice(),
//                   ),
//                 ),
//                 SliverList(
//                     delegate: SliverChildListDelegate([
//                   DeviceList(),
//                 ]))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
