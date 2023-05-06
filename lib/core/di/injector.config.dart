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
    as _i11;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i12;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i16;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i6;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i22;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i17;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i20;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i5;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i14;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i32;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i24;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i10;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i29;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i13;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i15;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i31;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i33;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i23;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i25;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i9;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i28;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i30;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i21;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i41;
import 'package:chatapp/presentation/auth/login/bloc/login_bloc.dart' as _i39;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i36;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i38;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i26;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i37;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i27;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i34;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i35;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i18;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i40;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i19;
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
    gh.singleton<_i3.AuthFirebase>(_i3.AuthFirebase());
    gh.singleton<_i4.AuthLocalDataSrc>(_i4.AuthLocalDataSrc());
    gh.singleton<_i5.ChatWebSocket>(
        _i5.ChatWebSocket(localDataSrc: gh<_i4.AuthLocalDataSrc>()));
    gh.singleton<_i6.DioInterceptor>(
        _i6.DioInterceptor(authLocalDataSrc: gh<_i4.AuthLocalDataSrc>()));
    gh.factory<_i7.FindFriendFormCubit>(() => _i7.FindFriendFormCubit());
    gh.factory<_i8.FriendInfoCubit>(() => _i8.FriendInfoCubit());
    gh.factory<_i9.MessageRepository>(() =>
        _i10.MessageRepositoryImpl(chatWebSocket: gh<_i5.ChatWebSocket>()));
    gh.singleton<_i11.SettingLocalDataSrc>(_i11.SettingLocalDataSrc());
    gh.singleton<_i12.UserLocalDataSrc>(_i12.UserLocalDataSrc());
    gh.factory<_i13.AppSettingsRepository>(() => _i14.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i11.SettingLocalDataSrc>()));
    gh.factory<_i15.AppSettingsUseCase>(() =>
        _i15.AppSettingsUseCaseImpl(repo: gh<_i13.AppSettingsRepository>()));
    gh.singleton<_i16.BaseService>(
        _i16.BaseService(interceptor: gh<_i6.DioInterceptor>()));
    gh.factory<_i17.FriendService>(
        () => _i17.FriendService(service: gh<_i16.BaseService>()));
    gh.factory<_i18.SettingLanguageCubit>(() =>
        _i18.SettingLanguageCubit(usecase: gh<_i15.AppSettingsUseCase>()));
    gh.factory<_i19.SettingThemeCubit>(
        () => _i19.SettingThemeCubit(usecase: gh<_i15.AppSettingsUseCase>()));
    gh.lazySingleton<_i20.UserService>(
        () => _i20.UserService(service: gh<_i16.BaseService>()));
    gh.factory<_i21.AppSettingsCubit>(
        () => _i21.AppSettingsCubit(useCase: gh<_i15.AppSettingsUseCase>()));
    gh.lazySingleton<_i22.AuthService>(
        () => _i22.AuthService(service: gh<_i16.BaseService>()));
    gh.factory<_i23.FriendRepository>(
        () => _i24.FriendRepositoryImpl(service: gh<_i17.FriendService>()));
    gh.factory<_i25.FriendUseCase>(
        () => _i25.FriendUseCaseImpl(repo: gh<_i23.FriendRepository>()));
    gh.factory<_i26.FriendsActionCubit>(
        () => _i26.FriendsActionCubit(friendUC: gh<_i25.FriendUseCase>()));
    gh.factory<_i27.ListFriendRequestBloc>(() =>
        _i27.ListFriendRequestBloc(friendUseCase: gh<_i25.FriendUseCase>()));
    gh.factory<_i28.UserRepository>(() => _i29.UserRepositoryImpl(
          service: gh<_i20.UserService>(),
          local: gh<_i12.UserLocalDataSrc>(),
        ));
    gh.factory<_i30.UserUseCase>(
        () => _i30.UserUseCaseImpl(repo: gh<_i28.UserRepository>()));
    gh.factory<_i31.AuthRepository>(() => _i32.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i22.AuthService>(),
          userRepo: gh<_i28.UserRepository>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i33.AuthUseCase>(
        () => _i33.AuthUseCaeImpl(repo: gh<_i31.AuthRepository>()));
    gh.factory<_i34.EditFormSubmitBloc>(
        () => _i34.EditFormSubmitBloc(userUseCase: gh<_i30.UserUseCase>()));
    gh.factory<_i35.EditProfileFormCubit>(
        () => _i35.EditProfileFormCubit(userUseCase: gh<_i30.UserUseCase>()));
    gh.factory<_i36.FindFriendBloc>(
        () => _i36.FindFriendBloc(userRepo: gh<_i28.UserRepository>()));
    gh.factory<_i37.FriendRequestActionCubit>(() =>
        _i37.FriendRequestActionCubit(friendUseCase: gh<_i25.FriendUseCase>()));
    gh.factory<_i38.FriendsContactBloc>(() => _i38.FriendsContactBloc(
          useCase: gh<_i25.FriendUseCase>(),
          userUseCase: gh<_i30.UserUseCase>(),
        ));
    gh.factory<_i39.LoginBloc>(
        () => _i39.LoginBloc(authRepo: gh<_i31.AuthRepository>()));
    gh.factory<_i40.SettingMainCubit>(() => _i40.SettingMainCubit(
          authUseCase: gh<_i33.AuthUseCase>(),
          userUseCase: gh<_i30.UserUseCase>(),
          appSettingsUseCase: gh<_i15.AppSettingsUseCase>(),
        ));
    gh.lazySingleton<_i41.AppBloc>(
        () => _i41.AppBloc(authUseCase: gh<_i33.AuthUseCase>()));
    return this;
  }
}
