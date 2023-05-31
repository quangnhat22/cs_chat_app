// part of create_group;

// class GroupSetPhoto extends StatelessWidget {
//   const GroupSetPhoto({super.key});

//   void _showImageDialog(BuildContext ctx) {
//     showDialog(
//         context: ctx,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               AppLocalizations.of(context)!.choose_image_source_dialog_title,
//               style: const TextStyle(fontSize: 20),
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 InkWellDynamicBorder(
//                   title: AppLocalizations.of(context)!.camera_source_option,
//                   leading: const Icon(
//                     Icons.camera_alt,
//                     color: Colors.black,
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _getFromCamera();
//                   },
//                 ),
//                 InkWellDynamicBorder(
//                   title: AppLocalizations.of(context)!.gallery_source_option,
//                   leading: const Icon(
//                     Icons.image,
//                     color: Colors.black,
//                   ),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _getFromGallery();
//                   },
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 25.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(
//               children: [
//                 CircleAvatar(
//                   radius: 55,
//                   backgroundImage:
//                       imageFile != null ? FileImage(imageFile!) : null,
//                   child: imageFile != null
//                       ? null
//                       : IconButton(
//                           onPressed: () {
//                             showImageDialog();
//                           },
//                           icon: const Icon(
//                             Icons.camera_alt_rounded,
//                             size: 35,
//                           ),
//                         ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: GestureDetector(
//                     onTap: () {
//                       showImageDialog();
//                     },
//                     child: Text(
//                       AppLocalizations.of(context)!.set_new_photo,
//                       style: const TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
