import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/presentation/friends/friends_detail/cubit/friend_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalChatRoomInfo extends StatelessWidget {
  const PersonalChatRoomInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FriendDetailCubit, FriendDetailState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: 160.w,
                height: 160.h,
                child: CustomAvatarImage(
                  urlImage: state.chatRoomDetail?.avatar,
                  maxRadiusEmptyImg: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              state.chatRoomDetail?.name ?? "",
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headlineTextStyle,
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        );
      },
    );
  }
}
