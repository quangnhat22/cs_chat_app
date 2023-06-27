// import 'package:chatapp/core/utils/formz/password.dart';
// import 'package:flutter/material.dart';

// class BtnChangePassword extends StatelessWidget {
//   const BtnChangePassword({
//     super.key,
//   });

//   void _onPressEditBtn(
//     BuildContext ctx,
//     Password? password,
//     Password? new_password,
//     Password? confirm_password,
//   ) {
//     ctx.read<EditFormSubmitBloc>().add(EditFormSubmitted(
//           password: password,
//           new_password: new_password,
//           confirm_password: confirm_password,
//         ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditFormSubmitBloc, EditFormSubmitState>(
//       builder: (context, EditFormSubmitState formState) {
//         return BlocBuilder<EditProfileFormCubit, EditProfileFormState>(
//           builder: (context, state) {
//             return formState.maybeWhen(
//               loading: () => const CircularProgressIndicator(),
//               orElse: () => Padding(
//                 padding: const EdgeInsets.only(top: 48),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: CustomElevatedButton(
//                     buttonText: AppLocalizations.of(context)!.confirm,
//                     onPressed: () => _onPressEditBtn(
//                       context,
//                       state.name,
//                       state.phoneNumber,
//                       state.birthday,
//                       state.gender,
//                       state.bio,
//                     ),
//                     backgroundColor: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
