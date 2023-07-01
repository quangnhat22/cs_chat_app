import 'dart:io';

import 'package:chatapp/common/widgets/stateless/circle_avatar/custom_avatar_image.dart';
import 'package:chatapp/common/widgets/stateless/dialog/asset_dialog.dart';
import 'package:chatapp/core/config/app_enum.dart';
import 'package:chatapp/core/config/app_text_style.dart';
import 'package:chatapp/core/utils/assets_picker.dart';
import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditGroupImage extends StatelessWidget {
  const EditGroupImage({super.key});

  void _showImageDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          return AssetDialog(
            handlePhotoFromCamera: () async {
              Navigator.of(ctx).pop(AppMediaResource.camera);
            },
            handlePhotoFromGallery: () async {
              Navigator.of(ctx).pop(AppMediaResource.gallery);
            },
          );
        }).then(
      (value) async {
        String? filePath;
        switch (value) {
          case AppMediaResource.gallery:
            {
              filePath = await AppAssetsPicker.pickImageFromGallery(ctx);
              break;
            }
          case AppMediaResource.camera:
            {
              filePath = await AppAssetsPicker.pickImageFromCamera(ctx);
              break;
            }
        }

        if (ctx.mounted && filePath != null) {
          ctx.read<EditGroupCubit>().groupImageChanged(filePath);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditGroupCubit, EditGroupState>(
      buildWhen: (prev, current) => prev.groupAvatar != current.groupAvatar,
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    if (!state.isChangeImage)
                      SizedBox(
                        height: 160,
                        width: 160,
                        child: CustomAvatarImage(
                          urlImage: state.groupAvatar,
                          widthImage: 24,
                        ),
                      ),
                    if (state.isChangeImage)
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: state.groupAvatar != null
                            ? FileImage(File(state.groupAvatar!))
                            : null,
                        child: state.groupAvatar != null
                            ? null
                            : IconButton(
                                onPressed: () => _showImageDialog(context),
                                icon: const Icon(
                                  Icons.camera_alt_rounded,
                                  size: 35,
                                ),
                              ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: GestureDetector(
                        onTap: () => _showImageDialog(context),
                        child: Text(
                          AppLocalizations.of(context)!.set_new_photo,
                          style: AppTextStyles.captionTextStyle,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
