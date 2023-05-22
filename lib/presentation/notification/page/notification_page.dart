part of notifications_lib;

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MHomeAppBar(
        title: AppLocalizations.of(context)!.notifications,
        actionButton: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ),
       body: SingleChildScrollView(
        child: NotificationList(),
      ),
      
    );
  }
}
