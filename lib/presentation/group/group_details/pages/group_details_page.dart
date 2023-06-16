import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/stateless/button/custom_text_button.dart';
import '../widgets/group_details_page_app_bar.dart';
import '../widgets/group_details_small_card_bottom.dart';
import '../widgets/group_details_small_card_top.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const MGroupDetailPageAppBar(title: "Details"),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 130,
                    width: double.infinity,
                    child: CustomAvatarImage(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "UIT is the best (K15)",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CustomTextButton(
                      AppLocalizations.of(context)!
                          .change_profile_picture_or_your_name,
                      () {},
                      Theme.of(context).colorScheme.primary),
                ),
                const GroupDetailsSmallCardTop(),
                SizedBox(
                    height: 4.h,
                ),
                const GroupDetailsSmallCardBottom(),
              ],
            ),
          ),
        ),
      );
    }
}
