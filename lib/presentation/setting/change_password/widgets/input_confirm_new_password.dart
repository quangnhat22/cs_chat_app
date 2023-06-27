import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/form/text_field.dart';


class InputConfirmNewPassword extends StatefulWidget {
  const InputConfirmNewPassword({super.key});

  @override
  State<InputConfirmNewPassword> createState() => _InputConfirmNewPasswordState();
}

class _InputConfirmNewPasswordState extends State<InputConfirmNewPassword> {
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
        icon: const Icon(Icons.check_circle),
        label: AppLocalizations.of(context)!.confirm_password,
      );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
