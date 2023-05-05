part of friends_infor;

class FriendsInforPage extends StatelessWidget {
  final bool isFriend = true;

  const FriendsInforPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> friendDetails = [
      {
        'title': AppLocalizations.of(context)!.full_name,
        'leading': Icon(
          Icons.badge,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.phone_number,
        'leading': Icon(
          Icons.call,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.gender,
        'leading': Icon(
          Icons.people,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
      {
        'title': AppLocalizations.of(context)!.birthday,
        'leading': Icon(
          Icons.today,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      },
    ];

    return Scaffold(
      appBar: MPageAppBar(
        title: AppLocalizations.of(context)!.friends,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FriendMutualInfor(null, 'Nguyễn Đình Nhật Quang', 500, 12),
            FriendDetailsInfor(friendDetails),
            if (isFriend) const FriendUnfriend(),
            if (!isFriend) const FriendActions()
          ],
        ),
      ),
    );
  }
}
