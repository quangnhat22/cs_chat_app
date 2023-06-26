import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class InputName extends StatelessWidget {
  const InputName({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            label: Text(AppLocalizations.of(context)!.group_name)),
      ),
    );
  }
}
