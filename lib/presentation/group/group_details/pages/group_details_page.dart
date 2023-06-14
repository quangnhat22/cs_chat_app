import 'package:chatapp/common/widgets/stateless/button/float_back_button.dart';
import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/presentation/auth/fogot_password/forgot_password.dart';
import 'package:chatapp/presentation/group/group_details/widgets/group_details_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/stateless/button/custom_text_button.dart';

class GroupDetailPage extends StatelessWidget {
  const GroupDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                  child: Row(
                    children: [
                      FloatBackButton(
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: CustomAvatarImage(),
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
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Hoạt động hôm nay",
                    style: TextStyle(
                      fontSize: 20,
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
              ],
            ),
            ShortFormCard(
              childWidget: GroupDetailsInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
