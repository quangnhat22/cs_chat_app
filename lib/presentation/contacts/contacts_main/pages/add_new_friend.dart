import 'package:chatapp/presentation/contacts/contacts_main/widgets/find_friend_button.dart';
import 'package:chatapp/presentation/contacts/contacts_main/widgets/find_friend_text_filled.dart';
import 'package:chatapp/presentation/contacts/contacts_main/widgets/friend_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class AddNewFriend extends StatefulWidget {
//   const AddNewFriend({super.key});

//   @override
//   State<AddNewFriend> createState() => _AddNewFriendState();
// }

// class _AddNewFriendState extends State<AddNewFriend> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const FindFriendTextFilled(),
//               const FindFriendButton(),
//               Container(
//                 width: double.infinity,
//                 alignment: Alignment.topLeft,
//                 padding: const EdgeInsets.only(top: 10, bottom: 10),
//                 child: Text(
//                   AppLocalizations.of(context)!.result,
//                   style: const TextStyle(
//                     fontSize: 25,
//                   ),
//                 ),
//               ),
//               const FriendProfile(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class AddNewFriend extends StatelessWidget {
  const AddNewFriend({super.key});

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
              const FindFriendTextFilled(),
              const FindFriendButton(),
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  AppLocalizations.of(context)!.result,
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              const FriendProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
