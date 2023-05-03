import 'package:chatapp/core/config/app_color.dart';
import 'package:chatapp/presentation/contacts/contacts_main/model/friend_model.dart';
import 'package:chatapp/presentation/contacts/contacts_main/widgets/friend_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                height: 90,
                alignment: Alignment.center,
                child: Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightColorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            Icons.account_circle,
                            size: 35,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.friend_request,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightColorScheme.onTertiary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Icon(
                            Icons.add_circle_outline,
                            size: 35,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            AppLocalizations.of(context)!.add_new_friend,
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ])),
            Container(
              width: double.infinity,
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  AppLocalizations.of(context)!.friends,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                ListView.builder(
                  itemCount: friend.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 16),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FriendList(
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
