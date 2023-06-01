// part of register;
//
// class InformRegisterPage extends StatelessWidget {
//   const InformRegisterPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const GoBackTextButton(
//                 applyText: "Back to Register",
//               ),
//               Padding(
//                   padding: const EdgeInsets.only(top: 99),
//                   child: Center(
//                       child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       AppAssets.csChat,
//                       Padding(
//                         padding:
//                             const EdgeInsets.only(top: 99, left: 33, right: 33),
//                         child: Text(
//                           "We have sent a verified email to you. Please check your email and click the link to verify your account",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.darkColorScheme.outline,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(
//                             top: 127, left: 20, right: 20, bottom: 54),
//                         child: SendButton(applyText: "I don't get it"),
//                       )
//                     ],
//                   ))),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
