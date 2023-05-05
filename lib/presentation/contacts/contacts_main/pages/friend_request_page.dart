import 'package:chatapp/presentation/contacts/contacts_main/widgets/friend_request.dart';
import 'package:flutter/material.dart';

class FriendRequestPage extends StatefulWidget {
  const FriendRequestPage({super.key});

  @override
  State<FriendRequestPage> createState() => _FriendRequestPageState();
}

class _FriendRequestPageState extends State<FriendRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: Column(children: [
                ListView.builder(
                  itemCount: 100,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const FriendRequest(
                      name: "123",
                      imageURL: "https://picsum.photos/200/300",
                    );
                  },
                )
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
