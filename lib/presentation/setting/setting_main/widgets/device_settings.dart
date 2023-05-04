import 'package:chatapp/common/widgets/stateless/divider/divider_space_left.dart';
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/widgets/ink_well/ink_well_dynamic_border.dart';

class DeviceSettings extends StatelessWidget {
  const DeviceSettings({Key? key}) : super(key: key);

  Future<void> _onTapLanguageBtn(BuildContext ctx, String currentLang) {
    // return _showEditDialog(ctx, const EditLanguageView());
    throw Exception();
  }

  Future<void> _onTapThemeBtn(BuildContext ctx, String currentTheme) {
    //return _showEditDialog(ctx, const EditThemeView());
    throw Exception();
  }

  Future<void> _showEditDialog(BuildContext ctx, Widget form) {
    return showDialog(
      context: ctx,
      builder: (context) => form,
    ).then((_) {
      //ctx.read<SettingCubit>().getValueThemeAndLang();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingMainCubit, SettingMainState>(
      builder: (context, state) {
        return state.maybeWhen(
          initial: (theme, lang) {
            return Card(
              child: Column(
                children: <Widget>[
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.language,
                    leading: const Icon(Icons.public),
                    trailing: Text(lang),
                    onTap: () => _onTapLanguageBtn(context, lang),
                    hasTopBorderRadius: true,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.theme,
                    leading: const Icon(Icons.brightness_medium_outlined),
                    trailing: Text(theme),
                    onTap: () => _onTapThemeBtn(context, theme),
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.notifications,
                    leading: const Icon(Icons.notifications_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: false,
                  ),
                  const DividerSpaceLeft(),
                  InkWellDynamicBorder(
                    title: AppLocalizations.of(context)!.devices,
                    leading: const Icon(Icons.devices_outlined),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                    hasTopBorderRadius: false,
                    hasBottomBorderRadius: true,
                  ),
                ],
              ),
            );
          },
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }
}
