part of create_group;

class GroupAddMembers extends StatelessWidget {
  GroupAddMembers({Key? key}) : super(key: key);

  final List<String> allFriends = [
    'Nguyễn Đình Nhật Quang',
    'Trần Đình Lộc',
    'Lê Hà Gia Bảo',
    'Lê Đức Hậu',
  ];

  final List<String> selectedFriends = [];
  late List<String> friendResults = [];

  void handleSelectMembers(String member) {
    if (!selectedFriends.contains(member)) {
      // setState(() {
      //   selectedFriends.add(member);
      // });
    } else {
      // setState(() {
      //   selectedFriends.remove(member);
      // });
    }
  }

  void handleTextChange(String value) {
    // if (value == '') {
    //   setState(() {
    //     friendResults = [...allFriends];
    //   });
    // } else {
    //   setState(() {
    //     friendResults = allFriends
    //         .where(
    //             (friend) => friend.toLowerCase().contains(value.toLowerCase()))
    //         .toList();
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Text(
            AppLocalizations.of(context)!.add_members,
            textAlign: TextAlign.center,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).colorScheme.onInverseSurface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              hintText: AppLocalizations.of(context)!.search_friends,
            ),
            onChanged: (value) {
              //onTextChange(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Text(
            '${selectedFriends.length} ${AppLocalizations.of(context)!.selected_text}',
            textAlign: TextAlign.start,
            style: AppTextStyles.mediumTitleTextStyle,
          ),
        ),
      ],
    );
  }
}
