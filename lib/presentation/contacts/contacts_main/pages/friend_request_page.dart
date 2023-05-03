import 'package:chatapp/core/config/app_color.dart';
import 'package:chatapp/presentation/contacts/contacts_main/model/friend_model.dart';
import 'package:chatapp/presentation/contacts/contacts_main/widgets/friend_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FriendRequestPage extends StatefulWidget {
  const FriendRequestPage({super.key});

  @override
  State<FriendRequestPage> createState() => _FriendRequestPageState();
}

class _FriendRequestPageState extends State<FriendRequestPage> {
  List<Friend> friend = [
    Friend(
      name: 'Jane Russel',
      imageURL: "images/userImage1.jpeg",
    ),
    Friend(
      name: "Glady's Murphy",
      imageURL: "images/userImage2.jpeg",
    ),
    Friend(
      name: "Jorge Henry",
      imageURL: "images/userImage3.jpeg",
    ),
    Friend(
      name: "Philip Fox",
      imageURL: "images/userImage4.jpeg",
    ),
    Friend(
      name: "Debra Hawkins",
      imageURL: "images/userImage5.jpeg",
    ),
  ];

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
                  itemCount: friend.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FriendRequest(
                      name: friend[index].name,
                      imageURL: friend[index].imageURL,
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
