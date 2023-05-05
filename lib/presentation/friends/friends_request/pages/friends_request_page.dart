part of friends_request;

enum Request { sent, received }

class FriendsRequestPage extends StatelessWidget {
  const FriendsRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const FriendsRequestView();
  }
}

class FriendsRequestView extends StatefulWidget {
  const FriendsRequestView({
    super.key,
  });

  @override
  State<FriendsRequestView> createState() => _FriendsRequestViewState();
}

class _FriendsRequestViewState extends State<FriendsRequestView> {
  Request view = Request.sent;

  void handleViewChange(Request selectedView) {
    setState(() {
      view = selectedView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[SegmentButtonFriendRequest(handleViewChange)],
            ),
          ),
          view == Request.sent
              ? const ListRequestFriendSend()
              : const ListRequestFriendReceive(),
        ],
      ),
    );
  }
}
