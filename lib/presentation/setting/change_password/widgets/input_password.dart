import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/stateless/form/text_field.dart';


class InputPassword extends StatefulWidget {
  const InputPassword({super.key});

  @override
  State<InputPassword> createState() => _InputpasswordState();
}

class _InputpasswordState extends State<InputPassword> {
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
        icon: const Icon(Icons.lock),
        label: AppLocalizations.of(context)!.password,
      );
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
}
