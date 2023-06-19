// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatapp/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:chatapp/data/data_sources/firebase/file_firebase.dart' as _i7;
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i11;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i12;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i16;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i6;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i28;
import 'package:chatapp/data/data_sources/remote/service/device_service.dart'
    as _i18;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i19;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i20;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i26;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i17;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i14;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i48;
import 'package:chatapp/data/repositories/device_repo_impl.dart' as _i30;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i33;
import 'package:chatapp/data/repositories/group_repo_impl.dart' as _i37;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i22;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i45;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i13;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i15;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i47;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i49;
import 'package:chatapp/domain/modules/device/device_repository.dart' as _i29;
import 'package:chatapp/domain/modules/device/device_usecase.dart' as _i31;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i32;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i34;
import 'package:chatapp/domain/modules/group/group_repository.dart' as _i36;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i38;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i21;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i23;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i44;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i46;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i27;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i61;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i58;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i60;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i50;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i10;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i43;
import 'package:chatapp/presentation/device/bloc/list_device_bloc.dart' as _i39;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i54;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i56;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i35;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i9;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i55;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i40;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i51;
import 'package:chatapp/presentation/group/groups_request/bloc/list_group_request_bloc.dart'
    as _i42;
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart'
    as _i57;
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart'
    as _i41;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i52;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i53;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i24;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i59;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i25;
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
    gh.singleton<_i6.DioInterceptor>(
        _i6.DioInterceptor(authLocalDataSrc: gh<_i4.AuthLocalDataSrc>()));
    gh.factory<_i7.FileStorageFirebase>(() => _i7.FileStorageFirebase());
    gh.factory<_i8.FindFriendFormCubit>(() => _i8.FindFriendFormCubit());
    gh.factory<_i9.FriendInfoCubit>(() => _i9.FriendInfoCubit());
    gh.factory<_i10.InputMessageCubit>(() => _i10.InputMessageCubit());
    gh.singleton<_i11.SettingLocalDataSrc>(_i11.SettingLocalDataSrc());
    gh.singleton<_i12.UserLocalDataSrc>(_i12.UserLocalDataSrc());
    gh.factory<_i13.AppSettingsRepository>(() => _i14.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i11.SettingLocalDataSrc>()));
    gh.factory<_i15.AppSettingsUseCase>(() =>
        _i15.AppSettingsUseCaseImpl(repo: gh<_i13.AppSettingsRepository>()));
    gh.singleton<_i16.BaseService>(
        _i16.BaseService(interceptor: gh<_i6.DioInterceptor>()));
    gh.factory<_i17.ChatWebSocket>(() => _i17.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i7.FileStorageFirebase>(),
        ));
    gh.factory<_i18.DeviceService>(
        () => _i18.DeviceService(service: gh<_i16.BaseService>()));
    gh.factory<_i19.FriendService>(
        () => _i19.FriendService(service: gh<_i16.BaseService>()));
    gh.factory<_i20.GroupService>(
        () => _i20.GroupService(service: gh<_i16.BaseService>()));
    gh.factory<_i21.MessageRepository>(() =>
        _i22.MessageRepositoryImpl(chatWebSocket: gh<_i17.ChatWebSocket>()));
    gh.factory<_i23.MessageUseCase>(
        () => _i23.MessageUseCaseImpl(repo: gh<_i21.MessageRepository>()));
    gh.factory<_i24.SettingLanguageCubit>(() =>
        _i24.SettingLanguageCubit(usecase: gh<_i15.AppSettingsUseCase>()));
    gh.factory<_i25.SettingThemeCubit>(
        () => _i25.SettingThemeCubit(usecase: gh<_i15.AppSettingsUseCase>()));
    gh.lazySingleton<_i26.UserService>(
        () => _i26.UserService(service: gh<_i16.BaseService>()));
    gh.factory<_i27.AppSettingsCubit>(
        () => _i27.AppSettingsCubit(useCase: gh<_i15.AppSettingsUseCase>()));
    gh.lazySingleton<_i28.AuthService>(
        () => _i28.AuthService(service: gh<_i16.BaseService>()));
    gh.factory<_i29.DeviceRepository>(
        () => _i30.DeviceRepoImpl(deviceService: gh<_i18.DeviceService>()));
    gh.factory<_i31.DeviceUseCase>(
        () => _i31.DeviceUseCaseImpl(deviceRepo: gh<_i29.DeviceRepository>()));
    gh.factory<_i32.FriendRepository>(
        () => _i33.FriendRepositoryImpl(service: gh<_i19.FriendService>()));
    gh.factory<_i34.FriendUseCase>(
        () => _i34.FriendUseCaseImpl(repo: gh<_i32.FriendRepository>()));
    gh.factory<_i35.FriendsActionCubit>(
        () => _i35.FriendsActionCubit(friendUC: gh<_i34.FriendUseCase>()));
    gh.factory<_i36.GroupRepository>(() => _i37.GroupRepoImpl(
          groupService: gh<_i20.GroupService>(),
          storageFirebase: gh<_i7.FileStorageFirebase>(),
        ));
    gh.factory<_i38.GroupUseCase>(
        () => _i38.GroupUseCaseImpl(groupRepo: gh<_i36.GroupRepository>()));
    gh.factory<_i39.ListDeviceBloc>(
        () => _i39.ListDeviceBloc(deviceUC: gh<_i31.DeviceUseCase>()));
    gh.factory<_i40.ListFriendRequestBloc>(() =>
        _i40.ListFriendRequestBloc(friendUseCase: gh<_i34.FriendUseCase>()));
    gh.factory<_i41.ListGroupBloc>(
        () => _i41.ListGroupBloc(groupUC: gh<_i38.GroupUseCase>()));
    gh.factory<_i42.ListGroupRequestBloc>(
        () => _i42.ListGroupRequestBloc(groupUseCase: gh<_i38.GroupUseCase>()));
    gh.factory<_i43.MessageStreamCubit>(
        () => _i43.MessageStreamCubit(messageUC: gh<_i23.MessageUseCase>()));
    gh.factory<_i44.UserRepository>(() => _i45.UserRepositoryImpl(
          service: gh<_i26.UserService>(),
          local: gh<_i12.UserLocalDataSrc>(),
          storageFirebase: gh<_i7.FileStorageFirebase>(),
        ));
    gh.factory<_i46.UserUseCase>(
        () => _i46.UserUseCaseImpl(repo: gh<_i44.UserRepository>()));
    gh.factory<_i47.AuthRepository>(() => _i48.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i28.AuthService>(),
          userRepo: gh<_i44.UserRepository>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i44.AuthUseCase>(
        () => _i44.AuthUseCaeImpl(repo: gh<_i42.AuthRepository>()));
    gh.factory<_i45.ChatRoomBloc>(() => _i45.ChatRoomBloc(
          userUC: gh<_i41.UserUseCase>(),
          friendUC: gh<_i30.FriendUseCase>(),
        ));
    gh.factory<_i51.CubitSubmitNewGroupCubit>(
        () => _i51.CubitSubmitNewGroupCubit(groupUC: gh<_i38.GroupUseCase>()));
    gh.factory<_i52.EditFormSubmitBloc>(
        () => _i52.EditFormSubmitBloc(userUseCase: gh<_i46.UserUseCase>()));
    gh.factory<_i53.EditProfileFormCubit>(
        () => _i53.EditProfileFormCubit(userUseCase: gh<_i46.UserUseCase>()));
    gh.factory<_i54.FindFriendBloc>(
        () => _i54.FindFriendBloc(userRepo: gh<_i44.UserRepository>()));
    gh.factory<_i55.FriendRequestActionCubit>(() =>
        _i55.FriendRequestActionCubit(friendUseCase: gh<_i34.FriendUseCase>()));
    gh.factory<_i56.FriendsContactBloc>(() => _i56.FriendsContactBloc(
          useCase: gh<_i34.FriendUseCase>(),
          userUseCase: gh<_i46.UserUseCase>(),
        ));
    gh.factory<_i57.GroupRequestActionCubit>(
        () => _i57.GroupRequestActionCubit(groupUC: gh<_i38.GroupUseCase>()));
    gh.factory<_i58.LoginCubit>(
        () => _i58.LoginCubit(authUC: gh<_i49.AuthUseCase>()));
    gh.factory<_i59.SettingMainCubit>(() => _i59.SettingMainCubit(
          authUseCase: gh<_i49.AuthUseCase>(),
          userUseCase: gh<_i46.UserUseCase>(),
          appSettingsUseCase: gh<_i15.AppSettingsUseCase>(),
        ));
    gh.factory<_i60.SignUpCubit>(
        () => _i60.SignUpCubit(authUC: gh<_i49.AuthUseCase>()));
    gh.lazySingleton<_i61.AppBloc>(
        () => _i61.AppBloc(authUseCase: gh<_i49.AuthUseCase>()));
    return this;
  }
}
