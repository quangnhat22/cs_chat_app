import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetPhoto extends StatelessWidget {
  const SetPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: const [
                    CircleAvatar(
                      radius: 55,

                    ),
                    // if (state.groupImage != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(top: 32),
                    //     child: GestureDetector(
                    //       onTap: () => _showImageDialog(context),
                    //       child: Text(
                    //         AppLocalizations.of(context)!.set_new_photo,
                    //         style: AppTextStyles.captionTextStyle,
                    //       ),
                    //     ),
                    //   )
                  ],
                )
              ],
            ),
          ],
        );
      }
  }
