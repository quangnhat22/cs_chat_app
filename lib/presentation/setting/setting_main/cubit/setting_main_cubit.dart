import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/modules/auth/auth_usecase.dart';

part 'setting_main_state.dart';
part 'setting_main_cubit.freezed.dart';

@Injectable()
class SettingMainCubit extends Cubit<SettingMainState> {
  final AuthUseCase authUseCase;
  final AppSettingsUseCase appSettingsUseCase;

  SettingMainCubit({
    required this.authUseCase,
    required this.appSettingsUseCase,
  }) : super(const SettingMainState.initial()) {
    getValueThemeAndLang();
  }

  Future<void> getValueThemeAndLang() async {
    final theme = await appSettingsUseCase.getAppTheme();
    final lang = await appSettingsUseCase.getAppLang();

    emit(state.copyWith(theme: theme, lang: lang));
  }

  Future<void> onTapLogOutBtn() async {
    await authUseCase.logOut();
  }
}
