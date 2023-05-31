part of create_group;

class CreateGroupPage extends StatelessWidget {
  const CreateGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CreateGroupCubit>(),
      child: const CreateGroupView(),
    );
  }
}

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  final List<String> allFriends = [
    'Nguyễn Đình Nhật Quang',
    'Trần Đình Lộc',
    'Lê Hà Gia Bảo',
    'Lê Đức Hậu',
  ];

  final List<String> selectedFriends = [];
  late List<String> friendResults;

  File? imageFile;

  @override
  void initState() {
    super.initState();
    friendResults = [...allFriends];
  }

  void handleSelectMembers(String member) {
    if (!selectedFriends.contains(member)) {
      setState(() {
        selectedFriends.add(member);
      });
    } else {
      setState(() {
        selectedFriends.remove(member);
      });
    }
  }

  void handleTextChange(String value) {
    if (value == '') {
      setState(() {
        friendResults = [...allFriends];
      });
    } else {
      setState(() {
        friendResults = allFriends
            .where(
                (friend) => friend.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.create_group_app_bar_title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          onPressed: () {
            NavigationUtil.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint(selectedFriends.toString());
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // const GroupSetPhoto(),
              const InputGroupName(),
              GroupAddMembers(selectedFriends, friendResults,
                  handleSelectMembers, handleTextChange)
            ]),
      ),
    );
  }
}
