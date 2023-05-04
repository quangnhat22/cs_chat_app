import 'package:chatapp/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FindFriendButton extends StatefulWidget {
  const FindFriendButton({super.key});

  @override
  State<FindFriendButton> createState() => _FindFriendButtonState();
}

class _FindFriendButtonState extends State<FindFriendButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding:
            const EdgeInsets.only(left: 100, right: 100, top: 10, bottom: 10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            backgroundColor:
                MaterialStateProperty.all(AppColors.lightColorScheme.primary),
          ),
          child: Text(
            AppLocalizations.of(context)!.find_friend,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ));
  }
}
