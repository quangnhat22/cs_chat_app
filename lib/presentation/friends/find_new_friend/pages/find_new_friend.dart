part of find_new_friend;

class FindNewFriendPage extends StatelessWidget {
  const FindNewFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.find_friend,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              InputFindFriend(),
              ButtonFindFriend(),
              NotFoundResult(),
            ],
          ),
        ),
      ),
    );
  }
}
