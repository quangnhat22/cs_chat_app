// import 'package:chatapp/presentation/setting/change_password/cubit/change_password_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../../common/widgets/stateless/button/custom_elevated_button.dart';

// class BtnChangePassword extends StatelessWidget {
//   const BtnChangePassword({
//     super.key,
//   });

//   void _handleOnPress(BuildContext ctx, String password, String oldPassword) {
//     ctx.read<ChangePasswordCubit>().updatePassword(password: password);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
//       builder: (context, formState) {
//         return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
//           builder: (context, state) {
//             return formState.maybeWhen(
//               // loading: () => const CircularProgressIndicator(),
//               orElse: () => Padding(
//                 padding: const EdgeInsets.only(top: 48),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: CustomElevatedButton(
//                     buttonText: AppLocalizations.of(context)!.confirm,
//                     onPressed: () {},
//                     // onPressed: () => _handleOnPress(ctx, password, oldPassword),
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
