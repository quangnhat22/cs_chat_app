import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/form/text_field.dart';


class InputNewPassword extends StatefulWidget {
  const InputNewPassword({super.key});

  @override
  State<InputNewPassword> createState() => _InputNewPasswordState();
}

class _InputNewPasswordState extends State<InputNewPassword> {
  // final TextEditingController _controller = TextEditingController();

  // @override
  // void initState() {
  //   _controller.addListener(() {
  //     context.read<EditProfileFormCubit>().bioChanged(_controller.text);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return CTextFormField(
        // controller: _controller,
        icon: const Icon(Icons.vpn_key),
        label: AppLocalizations.of(context)!.new_password,
      );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
