import 'package:chatapp/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FindFriendTextFilled extends StatefulWidget {
  const FindFriendTextFilled({super.key});

  @override
  State<FindFriendTextFilled> createState() => _FindFriendTextFilledState();
}

class _FindFriendTextFilledState extends State<FindFriendTextFilled> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightColorScheme.surfaceVariant,
            prefixIcon: const Icon(Icons.search),
            label: Text(AppLocalizations.of(context)!.email_label),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            )),
      ),
    );
  }
}
