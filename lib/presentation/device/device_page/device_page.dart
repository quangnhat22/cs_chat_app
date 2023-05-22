part of device_administration_lib;
class DeviceMainPage extends StatelessWidget {
  const DeviceMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.chat,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.0,
                      vertical: 8,
                    ),
                    child: SegmentButtonDevice(),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      DeviceList(),
                    ]
                  ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
