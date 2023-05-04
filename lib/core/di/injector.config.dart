// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatapp/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i6;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i7;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i11;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i5;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i16;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i14;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i9;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i21;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i18;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i8;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i10;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i20;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i22;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i17;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i19;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i15;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i26;
import 'package:chatapp/presentation/auth/login/bloc/login_bloc.dart' as _i24;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i23;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i12;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i25;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AuthFirebase>(() => _i3.AuthFirebase());
    gh.singleton<_i4.AuthLocalDataSrc>(_i4.AuthLocalDataSrc());
    gh.singleton<_i5.DioInterceptor>(
        _i5.DioInterceptor(gh<_i4.AuthLocalDataSrc>()));
    gh.singleton<_i6.SettingLocalDataSrc>(_i6.SettingLocalDataSrc());
    gh.singleton<_i7.UserLocalDataSrc>(_i7.UserLocalDataSrc());
    gh.factory<_i8.AppSettingsRepository>(() => _i9.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i6.SettingLocalDataSrc>()));
    gh.factory<_i10.AppSettingsUseCase>(() =>
        _i10.AppSettingsUseCaseImpl(repo: gh<_i8.AppSettingsRepository>()));
    gh.singleton<_i11.BaseService>(
        _i11.BaseService(interceptor: gh<_i5.DioInterceptor>()));
    gh.factory<_i12.SettingLanguageCubit>(() =>
        _i12.SettingLanguageCubit(usecase: gh<_i10.AppSettingsUseCase>()));
    gh.factory<_i13.SettingThemeCubit>(
        () => _i13.SettingThemeCubit(usecase: gh<_i10.AppSettingsUseCase>()));
    gh.lazySingleton<_i14.UserService>(
        () => _i14.UserService(service: gh<_i11.BaseService>()));
    gh.factory<_i15.AppSettingsCubit>(
        () => _i15.AppSettingsCubit(useCase: gh<_i10.AppSettingsUseCase>()));
    gh.lazySingleton<_i16.AuthService>(
        () => _i16.AuthService(service: gh<_i11.BaseService>()));
    gh.factory<_i17.UserRepository>(() => _i18.UserRepositoryImpl(
          service: gh<_i14.UserService>(),
          local: gh<_i7.UserLocalDataSrc>(),
        ));
    gh.factory<_i19.UserUseCase>(
        () => _i19.UserUseCaseImpl(repo: gh<_i17.UserRepository>()));
    gh.factory<_i20.AuthRepository>(() => _i21.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i16.AuthService>(),
          userRepo: gh<_i17.UserRepository>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i22.AuthUseCase>(
        () => _i22.AuthUseCaeImpl(repo: gh<_i20.AuthRepository>()));
    gh.factory<_i23.EditProfileFormCubit>(
        () => _i23.EditProfileFormCubit(userUseCase: gh<_i19.UserUseCase>()));
    gh.factory<_i24.LoginBloc>(
        () => _i24.LoginBloc(authRepo: gh<_i20.AuthRepository>()));
    gh.factory<_i25.SettingMainCubit>(() => _i25.SettingMainCubit(
          authUseCase: gh<_i22.AuthUseCase>(),
          userUseCase: gh<_i19.UserUseCase>(),
          appSettingsUseCase: gh<_i10.AppSettingsUseCase>(),
        ));
    gh.lazySingleton<_i26.AppBloc>(
        () => _i26.AppBloc(authUseCase: gh<_i22.AuthUseCase>()));
    return this;
  }
}
