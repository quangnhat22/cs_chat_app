// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatapp/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:chatapp/data/data_sources/firebase/file_firebase.dart' as _i9;
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i13;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i14;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i18;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i8;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i29;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i20;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i21;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i27;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i19;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i16;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i40;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i31;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i23;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i37;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i15;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i17;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i39;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i41;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i30;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i32;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i7;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i22;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i24;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i36;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i38;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i28;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i51;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i48;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i50;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i42;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i12;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i35;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i45;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i10;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i47;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i33;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i11;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i46;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i34;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i6;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i43;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i44;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i25;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i49;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i26;
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
    gh.factory<_i5.CreateGroupCubit>(() => _i5.CreateGroupCubit());
    gh.factory<_i6.CubitSubmitNewGroupCubit>(
        () => _i6.CubitSubmitNewGroupCubit(groupUC: gh<_i7.GroupUseCase>()));
    gh.singleton<_i8.DioInterceptor>(
        _i8.DioInterceptor(authLocalDataSrc: gh<_i4.AuthLocalDataSrc>()));
    gh.factory<_i9.FileStorageFirebase>(() => _i9.FileStorageFirebase());
    gh.factory<_i10.FindFriendFormCubit>(() => _i10.FindFriendFormCubit());
    gh.factory<_i11.FriendInfoCubit>(() => _i11.FriendInfoCubit());
    gh.factory<_i12.InputMessageCubit>(() => _i12.InputMessageCubit());
    gh.singleton<_i13.SettingLocalDataSrc>(_i13.SettingLocalDataSrc());
    gh.singleton<_i14.UserLocalDataSrc>(_i14.UserLocalDataSrc());
    gh.factory<_i15.AppSettingsRepository>(() => _i16.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i13.SettingLocalDataSrc>()));
    gh.factory<_i17.AppSettingsUseCase>(() =>
        _i17.AppSettingsUseCaseImpl(repo: gh<_i15.AppSettingsRepository>()));
    gh.singleton<_i18.BaseService>(
        _i18.BaseService(interceptor: gh<_i8.DioInterceptor>()));
    gh.factory<_i19.ChatWebSocket>(() => _i19.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i9.FileStorageFirebase>(),
        ));
    gh.factory<_i20.FriendService>(
        () => _i20.FriendService(service: gh<_i18.BaseService>()));
    gh.factory<_i21.GroupService>(
        () => _i21.GroupService(service: gh<_i18.BaseService>()));
    gh.factory<_i22.MessageRepository>(() =>
        _i23.MessageRepositoryImpl(chatWebSocket: gh<_i19.ChatWebSocket>()));
    gh.factory<_i24.MessageUseCase>(
        () => _i24.MessageUseCaseImpl(repo: gh<_i22.MessageRepository>()));
    gh.factory<_i25.SettingLanguageCubit>(() =>
        _i25.SettingLanguageCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i26.SettingThemeCubit>(
        () => _i26.SettingThemeCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.lazySingleton<_i27.UserService>(
        () => _i27.UserService(service: gh<_i18.BaseService>()));
    gh.factory<_i28.AppSettingsCubit>(
        () => _i28.AppSettingsCubit(useCase: gh<_i17.AppSettingsUseCase>()));
    gh.lazySingleton<_i29.AuthService>(
        () => _i29.AuthService(service: gh<_i18.BaseService>()));
    gh.factory<_i30.FriendRepository>(
        () => _i31.FriendRepositoryImpl(service: gh<_i20.FriendService>()));
    gh.factory<_i32.FriendUseCase>(
        () => _i32.FriendUseCaseImpl(repo: gh<_i30.FriendRepository>()));
    gh.factory<_i33.FriendsActionCubit>(
        () => _i33.FriendsActionCubit(friendUC: gh<_i32.FriendUseCase>()));
    gh.factory<_i34.ListFriendRequestBloc>(() =>
        _i34.ListFriendRequestBloc(friendUseCase: gh<_i32.FriendUseCase>()));
    gh.factory<_i35.MessageStreamCubit>(
        () => _i35.MessageStreamCubit(messageUC: gh<_i24.MessageUseCase>()));
    gh.factory<_i36.UserRepository>(() => _i37.UserRepositoryImpl(
          service: gh<_i27.UserService>(),
          local: gh<_i14.UserLocalDataSrc>(),
          storageFirebase: gh<_i9.FileStorageFirebase>(),
        ));
    gh.factory<_i38.UserUseCase>(
        () => _i38.UserUseCaseImpl(repo: gh<_i36.UserRepository>()));
    gh.factory<_i39.AuthRepository>(() => _i40.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i29.AuthService>(),
          userRepo: gh<_i36.UserRepository>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i41.AuthUseCase>(
        () => _i41.AuthUseCaeImpl(repo: gh<_i39.AuthRepository>()));
    gh.factory<_i42.ChatRoomBloc>(() => _i42.ChatRoomBloc(
          userUC: gh<_i38.UserUseCase>(),
          friendUC: gh<_i32.FriendUseCase>(),
        ));
    gh.factory<_i43.EditFormSubmitBloc>(
        () => _i43.EditFormSubmitBloc(userUseCase: gh<_i38.UserUseCase>()));
    gh.factory<_i44.EditProfileFormCubit>(
        () => _i44.EditProfileFormCubit(userUseCase: gh<_i38.UserUseCase>()));
    gh.factory<_i45.FindFriendBloc>(
        () => _i45.FindFriendBloc(userRepo: gh<_i36.UserRepository>()));
    gh.factory<_i46.FriendRequestActionCubit>(() =>
        _i46.FriendRequestActionCubit(friendUseCase: gh<_i32.FriendUseCase>()));
    gh.factory<_i47.FriendsContactBloc>(() => _i47.FriendsContactBloc(
          useCase: gh<_i32.FriendUseCase>(),
          userUseCase: gh<_i38.UserUseCase>(),
        ));
    gh.factory<_i48.LoginCubit>(
        () => _i48.LoginCubit(authUC: gh<_i41.AuthUseCase>()));
    gh.factory<_i49.SettingMainCubit>(() => _i49.SettingMainCubit(
          authUseCase: gh<_i41.AuthUseCase>(),
          userUseCase: gh<_i38.UserUseCase>(),
          appSettingsUseCase: gh<_i17.AppSettingsUseCase>(),
        ));
    gh.factory<_i50.SignUpCubit>(
        () => _i50.SignUpCubit(authUC: gh<_i41.AuthUseCase>()));
    gh.lazySingleton<_i51.AppBloc>(
        () => _i51.AppBloc(authUseCase: gh<_i41.AuthUseCase>()));
    return this;
  }
}
