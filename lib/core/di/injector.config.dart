// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chatapp/data/data_sources/firebase/auth_firebase.dart' as _i3;
import 'package:chatapp/data/data_sources/firebase/file_firebase.dart' as _i6;
import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart'
    as _i4;
import 'package:chatapp/data/data_sources/local/local_data_src.dart' as _i16;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i10;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i11;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i25;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i23;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i30;
import 'package:chatapp/data/data_sources/remote/service/device_service.dart'
    as _i26;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i27;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i28;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i29;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i15;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i13;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i52;
import 'package:chatapp/data/repositories/chat_room_repo_impl.dart' as _i32;
import 'package:chatapp/data/repositories/device_repo_impl.dart' as _i35;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i38;
import 'package:chatapp/data/repositories/group_repo_impl.dart' as _i42;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i18;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i49;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i12;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i14;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i51;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i53;
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart'
    as _i31;
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart'
    as _i33;
import 'package:chatapp/domain/modules/device/device_repository.dart' as _i34;
import 'package:chatapp/domain/modules/device/device_usecase.dart' as _i36;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i37;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i39;
import 'package:chatapp/domain/modules/group/group_repository.dart' as _i41;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i43;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i17;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i19;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i48;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i50;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i22;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i66;
import 'package:chatapp/presentation/auth/fogot_password/cubit_forgot_pasword/forgot_password_cubit.dart'
    as _i59;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i63;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i65;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i54;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i9;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i24;
import 'package:chatapp/presentation/device/bloc/list_device_bloc.dart' as _i44;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i58;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i61;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i40;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i60;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i45;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i55;
import 'package:chatapp/presentation/group/groups_request/bloc/list_group_request_bloc.dart'
    as _i47;
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart'
    as _i62;
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart'
    as _i46;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i56;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i57;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i20;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i64;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i21;
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
    gh.factory<_i6.FileStorageFirebase>(() => _i6.FileStorageFirebase());
    gh.factory<_i7.FindFriendFormCubit>(() => _i7.FindFriendFormCubit());
    gh.factory<_i8.FriendInfoCubit>(() => _i8.FriendInfoCubit());
    gh.factory<_i9.InputMessageCubit>(() => _i9.InputMessageCubit());
    gh.singleton<_i10.SettingLocalDataSrc>(_i10.SettingLocalDataSrc());
    gh.singleton<_i11.UserLocalDataSrc>(_i11.UserLocalDataSrc());
    gh.factory<_i12.AppSettingsRepository>(() => _i13.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i10.SettingLocalDataSrc>()));
    gh.factory<_i14.AppSettingsUseCase>(() =>
        _i14.AppSettingsUseCaseImpl(repo: gh<_i12.AppSettingsRepository>()));
    gh.factory<_i15.ChatWebSocket>(() => _i15.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.singleton<_i16.LocalDataSrc>(_i16.LocalDataSrc(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i10.SettingLocalDataSrc>(),
      gh<_i11.UserLocalDataSrc>(),
    ));
    gh.factory<_i17.MessageRepository>(() =>
        _i18.MessageRepositoryImpl(chatWebSocket: gh<_i15.ChatWebSocket>()));
    gh.factory<_i19.MessageUseCase>(
        () => _i19.MessageUseCaseImpl(repo: gh<_i17.MessageRepository>()));
    gh.factory<_i20.SettingLanguageCubit>(() =>
        _i20.SettingLanguageCubit(usecase: gh<_i14.AppSettingsUseCase>()));
    gh.factory<_i21.SettingThemeCubit>(
        () => _i21.SettingThemeCubit(usecase: gh<_i14.AppSettingsUseCase>()));
    gh.factory<_i22.AppSettingsCubit>(
        () => _i22.AppSettingsCubit(useCase: gh<_i14.AppSettingsUseCase>()));
    gh.singleton<_i23.DioInterceptor>(_i23.DioInterceptor(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i16.LocalDataSrc>(),
    ));
    gh.factory<_i24.MessageStreamCubit>(
        () => _i24.MessageStreamCubit(messageUC: gh<_i19.MessageUseCase>()));
    gh.singleton<_i25.BaseService>(
        _i25.BaseService(interceptor: gh<_i23.DioInterceptor>()));
    gh.factory<_i26.DeviceService>(
        () => _i26.DeviceService(service: gh<_i25.BaseService>()));
    gh.factory<_i27.FriendService>(
        () => _i27.FriendService(service: gh<_i25.BaseService>()));
    gh.factory<_i28.GroupService>(
        () => _i28.GroupService(service: gh<_i25.BaseService>()));
    gh.lazySingleton<_i29.UserService>(
        () => _i29.UserService(service: gh<_i25.BaseService>()));
    gh.lazySingleton<_i30.AuthService>(
        () => _i30.AuthService(service: gh<_i25.BaseService>()));
    gh.factory<_i31.ChatRoomRepository>(() => _i32.ChatRoomRepoImpl(
          gh<_i28.GroupService>(),
          gh<_i27.FriendService>(),
        ));
    gh.factory<_i33.ChatRoomUseCase>(
        () => _i33.ChatRoomUseCaseImpl(gh<_i31.ChatRoomRepository>()));
    gh.factory<_i34.DeviceRepository>(
        () => _i35.DeviceRepoImpl(deviceService: gh<_i26.DeviceService>()));
    gh.factory<_i36.DeviceUseCase>(
        () => _i36.DeviceUseCaseImpl(deviceRepo: gh<_i34.DeviceRepository>()));
    gh.factory<_i37.FriendRepository>(
        () => _i38.FriendRepositoryImpl(service: gh<_i27.FriendService>()));
    gh.factory<_i39.FriendUseCase>(
        () => _i39.FriendUseCaseImpl(repo: gh<_i37.FriendRepository>()));
    gh.factory<_i40.FriendsActionCubit>(
        () => _i40.FriendsActionCubit(friendUC: gh<_i39.FriendUseCase>()));
    gh.factory<_i41.GroupRepository>(() => _i42.GroupRepoImpl(
          groupService: gh<_i28.GroupService>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i43.GroupUseCase>(
        () => _i43.GroupUseCaseImpl(groupRepo: gh<_i41.GroupRepository>()));
    gh.factory<_i44.ListDeviceBloc>(
        () => _i44.ListDeviceBloc(deviceUC: gh<_i36.DeviceUseCase>()));
    gh.factory<_i45.ListFriendRequestBloc>(() =>
        _i45.ListFriendRequestBloc(friendUseCase: gh<_i39.FriendUseCase>()));
    gh.factory<_i46.ListGroupBloc>(
        () => _i46.ListGroupBloc(gh<_i33.ChatRoomUseCase>()));
    gh.factory<_i47.ListGroupRequestBloc>(
        () => _i47.ListGroupRequestBloc(groupUseCase: gh<_i43.GroupUseCase>()));
    gh.factory<_i48.UserRepository>(() => _i49.UserRepositoryImpl(
          service: gh<_i29.UserService>(),
          local: gh<_i11.UserLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i50.UserUseCase>(
        () => _i50.UserUseCaseImpl(repo: gh<_i48.UserRepository>()));
    gh.factory<_i51.AuthRepository>(() => _i52.AuthRepositoryImpl(
          gh<_i3.AuthFirebase>(),
          gh<_i30.AuthService>(),
          gh<_i48.UserRepository>(),
          gh<_i4.AuthLocalDataSrc>(),
          gh<_i16.LocalDataSrc>(),
        ));
    gh.factory<_i53.AuthUseCase>(
        () => _i53.AuthUseCaeImpl(repo: gh<_i51.AuthRepository>()));
    gh.factory<_i54.ChatRoomBloc>(() => _i54.ChatRoomBloc(
          gh<_i50.UserUseCase>(),
          gh<_i33.ChatRoomUseCase>(),
        ));
    gh.factory<_i55.CubitSubmitNewGroupCubit>(
        () => _i55.CubitSubmitNewGroupCubit(groupUC: gh<_i43.GroupUseCase>()));
    gh.factory<_i56.EditFormSubmitBloc>(
        () => _i56.EditFormSubmitBloc(userUseCase: gh<_i50.UserUseCase>()));
    gh.factory<_i57.EditProfileFormCubit>(
        () => _i57.EditProfileFormCubit(userUseCase: gh<_i50.UserUseCase>()));
    gh.factory<_i58.FindFriendBloc>(
        () => _i58.FindFriendBloc(userRepo: gh<_i48.UserRepository>()));
    gh.factory<_i59.ForgotPasswordCubit>(
        () => _i59.ForgotPasswordCubit(gh<_i53.AuthUseCase>()));
    gh.factory<_i60.FriendRequestActionCubit>(() =>
        _i60.FriendRequestActionCubit(friendUseCase: gh<_i39.FriendUseCase>()));
    gh.factory<_i61.FriendsContactBloc>(() => _i61.FriendsContactBloc(
          gh<_i33.ChatRoomUseCase>(),
          gh<_i50.UserUseCase>(),
        ));
    gh.factory<_i62.GroupRequestActionCubit>(
        () => _i62.GroupRequestActionCubit(groupUC: gh<_i43.GroupUseCase>()));
    gh.factory<_i63.LoginCubit>(
        () => _i63.LoginCubit(authUC: gh<_i53.AuthUseCase>()));
    gh.factory<_i64.SettingMainCubit>(() => _i64.SettingMainCubit(
          authUseCase: gh<_i53.AuthUseCase>(),
          userUseCase: gh<_i50.UserUseCase>(),
          appSettingsUseCase: gh<_i14.AppSettingsUseCase>(),
        ));
    gh.factory<_i65.SignUpCubit>(
        () => _i65.SignUpCubit(authUC: gh<_i53.AuthUseCase>()));
    gh.lazySingleton<_i66.AppBloc>(
        () => _i66.AppBloc(authUseCase: gh<_i53.AuthUseCase>()));
    return this;
  }
}
