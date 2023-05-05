part of find_new_friend;

class ButtonFindFriend extends StatelessWidget {
  const ButtonFindFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomElevatedButton(
        AppLocalizations.of(context)!.find_friend,
        () {},
        Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
