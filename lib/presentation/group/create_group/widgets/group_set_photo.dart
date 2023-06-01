part of create_group;

class GroupSetPhoto extends StatelessWidget {
  const GroupSetPhoto({super.key});

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

        if (ctx.mounted) {
          ctx.read<CreateGroupCubit>().groupImageChanged(filePath);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateGroupCubit, CreateGroupState>(
      buildWhen: (prev, current) => prev.groupImage != current.groupImage,
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
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: state.groupImage != null
                          ? FileImage(File(state.groupImage!))
                          : null,
                      child: state.groupImage != null
                          ? null
                          : IconButton(
                              onPressed: () => _showImageDialog(context),
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                size: 35,
                              ),
                            ),
                    ),
                    if (state.groupImage != null)
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
