part of edit_profile;

// class InputFullName extends StatefulWidget {
//   const InputFullName({super.key});

//   @override
//   State<InputFullName> createState() => _InputFullNameState();
// }

// class _InputFullNameState extends State<InputFullName> {
//   final _fullNameController = TextEditingController();

//   @override
//   void initState() {
//     if (mounted) {
//       _fullNameController.addListener(() {
//         context
//             .read<EditProfileFormCubit>()
//             .fullnameChanged(_fullNameController.text);
//       });
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CTextFormField(
//       controller: _fullNameController,
//       icon: const Icon(Icons.badge_outlined),
//       label: AppLocalizations.of(context)!.full_name,
//       errorText: ,
//       type: InputType.text,
//     );
//   }

//   @override
//   void dispose() {
//     _fullNameController.dispose();
//     super.dispose();
//   }
// }

class InputFullName extends StatelessWidget {
  const InputFullName({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return CTextFormField(
        controller: controller,
        icon: const Icon(Icons.badge_outlined),
        label: AppLocalizations.of(context)!.full_name);
  }
}
