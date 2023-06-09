import 'dart:async';

import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
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
  final UserUseCase userUseCase;
  late StreamSubscription<UserEntity?> userSubcription;

  SettingMainCubit({
    required this.authUseCase,
    required this.userUseCase,
    required this.appSettingsUseCase,
  }) : super(const SettingMainState.initial()) {
    getValueThemeAndLang();
    userInforChanged();
    //register subcription for listening changing in local user data
    userSubcription = userUseCase.getStreamSelfFromLocal().listen((user) {
      if (user != null) {
        userInforChanged();
      }
    });
  }

  Future<void> getValueThemeAndLang() async {
    final theme = await appSettingsUseCase.getAppTheme();
    final lang = await appSettingsUseCase.getAppLang();

    emit(state.copyWith(theme: theme, lang: lang));
  }

  Future<void> updateAvatar(String? filePath) async {
    if (filePath == null) return;
    final isUpdateAvatarSuccess = await userUseCase.updateAvatar(filePath);
    if (isUpdateAvatarSuccess) {
      await userInforChanged();
    }
  }

  Future<void> userInforChanged() async {
    final userInfo = await userUseCase.getSelfFromLocal();
    if (userInfo != null) {
      emit(state.copyWith(
        name: userInfo.name,
        avatar: userInfo.avatar,
        email: userInfo.email,
      ));
    }
  }

  Future<void> onTapLogOutBtn() async {
    await authUseCase.logOut();
  }

  @override
  Future<void> close() {
    userSubcription.cancel();
    return super.close();
  }
}
