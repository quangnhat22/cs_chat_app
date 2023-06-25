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
import 'package:chatapp/data/data_sources/local/local_data_src.dart' as _i18;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i12;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i13;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i27;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i25;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i33;
import 'package:chatapp/data/data_sources/remote/service/device_service.dart'
    as _i28;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i29;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i30;
import 'package:chatapp/data/data_sources/remote/service/search_service.dart'
    as _i31;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i32;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i17;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i15;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i59;
import 'package:chatapp/data/repositories/chat_room_repo_impl.dart' as _i35;
import 'package:chatapp/data/repositories/device_repo_impl.dart' as _i38;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i41;
import 'package:chatapp/data/repositories/group_repo_impl.dart' as _i45;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i20;
import 'package:chatapp/data/repositories/search_repo_impl.dart' as _i53;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i56;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i14;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i16;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i58;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i60;
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart'
    as _i34;
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart'
    as _i36;
import 'package:chatapp/domain/modules/device/device_repository.dart' as _i37;
import 'package:chatapp/domain/modules/device/device_usecase.dart' as _i39;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i40;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i42;
import 'package:chatapp/domain/modules/group/group_repository.dart' as _i44;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i46;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i19;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i21;
import 'package:chatapp/domain/modules/search/search_repository.dart' as _i52;
import 'package:chatapp/domain/modules/search/search_use_case.dart' as _i54;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i55;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i57;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i24;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i74;
import 'package:chatapp/presentation/auth/fogot_password/cubit_forgot_pasword/forgot_password_cubit.dart'
    as _i66;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i70;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i73;
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart'
    as _i47;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i61;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i9;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i26;
import 'package:chatapp/presentation/device/bloc/list_device_bloc.dart' as _i48;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i65;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i68;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i43;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i67;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i49;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i62;
import 'package:chatapp/presentation/group/groups_request/bloc/list_group_request_bloc.dart'
    as _i51;
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart'
    as _i69;
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart'
    as _i50;
import 'package:chatapp/presentation/search/bloc/search_bloc.dart' as _i71;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i63;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i64;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i22;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i72;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i23;
import 'package:chatapp/service/notification_controller.dart' as _i10;
import 'package:chatapp/service/notification_service.dart' as _i11;
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
    gh.factory<_i10.NotificationController>(
        () => _i10.NotificationController());
    gh.singleton<_i11.NotificationService>(_i11.NotificationService());
    gh.singleton<_i12.SettingLocalDataSrc>(_i12.SettingLocalDataSrc());
    gh.singleton<_i13.UserLocalDataSrc>(_i13.UserLocalDataSrc());
    gh.factory<_i14.AppSettingsRepository>(() => _i15.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i12.SettingLocalDataSrc>()));
    gh.factory<_i16.AppSettingsUseCase>(() =>
        _i16.AppSettingsUseCaseImpl(repo: gh<_i14.AppSettingsRepository>()));
    gh.factory<_i17.ChatWebSocket>(() => _i17.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.singleton<_i18.LocalDataSrc>(_i18.LocalDataSrc(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i12.SettingLocalDataSrc>(),
      gh<_i13.UserLocalDataSrc>(),
    ));
    gh.factory<_i19.MessageRepository>(() =>
        _i20.MessageRepositoryImpl(chatWebSocket: gh<_i17.ChatWebSocket>()));
    gh.factory<_i21.MessageUseCase>(
        () => _i21.MessageUseCaseImpl(repo: gh<_i19.MessageRepository>()));
    gh.factory<_i22.SettingLanguageCubit>(() =>
        _i22.SettingLanguageCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i23.SettingThemeCubit>(
        () => _i23.SettingThemeCubit(usecase: gh<_i16.AppSettingsUseCase>()));
    gh.factory<_i24.AppSettingsCubit>(
        () => _i24.AppSettingsCubit(useCase: gh<_i16.AppSettingsUseCase>()));
    gh.singleton<_i25.DioInterceptor>(_i25.DioInterceptor(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i18.LocalDataSrc>(),
    ));
    gh.factory<_i26.MessageStreamCubit>(
        () => _i26.MessageStreamCubit(messageUC: gh<_i21.MessageUseCase>()));
    gh.singleton<_i27.BaseService>(
        _i27.BaseService(interceptor: gh<_i25.DioInterceptor>()));
    gh.factory<_i28.DeviceService>(
        () => _i28.DeviceService(service: gh<_i27.BaseService>()));
    gh.factory<_i29.FriendService>(
        () => _i29.FriendService(service: gh<_i27.BaseService>()));
    gh.factory<_i30.GroupService>(
        () => _i30.GroupService(service: gh<_i27.BaseService>()));
    gh.factory<_i31.SearchService>(
        () => _i31.SearchService(service: gh<_i27.BaseService>()));
    gh.lazySingleton<_i32.UserService>(
        () => _i32.UserService(service: gh<_i27.BaseService>()));
    gh.lazySingleton<_i33.AuthService>(
        () => _i33.AuthService(service: gh<_i27.BaseService>()));
    gh.factory<_i34.ChatRoomRepository>(() => _i35.ChatRoomRepoImpl(
          gh<_i30.GroupService>(),
          gh<_i29.FriendService>(),
        ));
    gh.factory<_i36.ChatRoomUseCase>(
        () => _i36.ChatRoomUseCaseImpl(gh<_i34.ChatRoomRepository>()));
    gh.factory<_i37.DeviceRepository>(
        () => _i38.DeviceRepoImpl(deviceService: gh<_i28.DeviceService>()));
    gh.factory<_i39.DeviceUseCase>(
        () => _i39.DeviceUseCaseImpl(deviceRepo: gh<_i37.DeviceRepository>()));
    gh.factory<_i40.FriendRepository>(
        () => _i41.FriendRepositoryImpl(service: gh<_i29.FriendService>()));
    gh.factory<_i42.FriendUseCase>(
        () => _i42.FriendUseCaseImpl(repo: gh<_i40.FriendRepository>()));
    gh.factory<_i43.FriendsActionCubit>(
        () => _i43.FriendsActionCubit(friendUC: gh<_i42.FriendUseCase>()));
    gh.factory<_i44.GroupRepository>(() => _i45.GroupRepoImpl(
          groupService: gh<_i30.GroupService>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i46.GroupUseCase>(
        () => _i46.GroupUseCaseImpl(groupRepo: gh<_i44.GroupRepository>()));
    gh.factory<_i47.ListChatRoomBloc>(
        () => _i47.ListChatRoomBloc(gh<_i36.ChatRoomUseCase>()));
    gh.factory<_i48.ListDeviceBloc>(
        () => _i48.ListDeviceBloc(deviceUC: gh<_i39.DeviceUseCase>()));
    gh.factory<_i49.ListFriendRequestBloc>(() =>
        _i49.ListFriendRequestBloc(friendUseCase: gh<_i42.FriendUseCase>()));
    gh.factory<_i50.ListGroupBloc>(
        () => _i50.ListGroupBloc(gh<_i36.ChatRoomUseCase>()));
    gh.factory<_i51.ListGroupRequestBloc>(
        () => _i51.ListGroupRequestBloc(groupUseCase: gh<_i46.GroupUseCase>()));
    gh.factory<_i52.SearchRepository>(
        () => _i53.SearchRepositoryImpl(service: gh<_i31.SearchService>()));
    gh.factory<_i54.SearchUseCase>(
        () => _i54.SearchUseCaseImpl(repo: gh<_i52.SearchRepository>()));
    gh.factory<_i55.UserRepository>(() => _i56.UserRepositoryImpl(
          service: gh<_i32.UserService>(),
          local: gh<_i13.UserLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i57.UserUseCase>(
        () => _i57.UserUseCaseImpl(repo: gh<_i55.UserRepository>()));
    gh.factory<_i58.AuthRepository>(() => _i59.AuthRepositoryImpl(
          gh<_i3.AuthFirebase>(),
          gh<_i33.AuthService>(),
          gh<_i55.UserRepository>(),
          gh<_i4.AuthLocalDataSrc>(),
          gh<_i18.LocalDataSrc>(),
          gh<_i11.NotificationService>(),
        ));
    gh.factory<_i60.AuthUseCase>(
        () => _i60.AuthUseCaeImpl(repo: gh<_i58.AuthRepository>()));
    gh.factory<_i61.ChatRoomBloc>(() => _i61.ChatRoomBloc(
          gh<_i57.UserUseCase>(),
          gh<_i36.ChatRoomUseCase>(),
        ));
    gh.factory<_i62.CubitSubmitNewGroupCubit>(
        () => _i62.CubitSubmitNewGroupCubit(groupUC: gh<_i46.GroupUseCase>()));
    gh.factory<_i63.EditFormSubmitBloc>(
        () => _i63.EditFormSubmitBloc(userUseCase: gh<_i57.UserUseCase>()));
    gh.factory<_i64.EditProfileFormCubit>(
        () => _i64.EditProfileFormCubit(userUseCase: gh<_i57.UserUseCase>()));
    gh.factory<_i65.FindFriendBloc>(
        () => _i65.FindFriendBloc(userRepo: gh<_i55.UserRepository>()));
    gh.factory<_i66.ForgotPasswordCubit>(
        () => _i66.ForgotPasswordCubit(gh<_i60.AuthUseCase>()));
    gh.factory<_i67.FriendRequestActionCubit>(() =>
        _i67.FriendRequestActionCubit(friendUseCase: gh<_i42.FriendUseCase>()));
    gh.factory<_i68.FriendsContactBloc>(() => _i68.FriendsContactBloc(
          gh<_i42.FriendUseCase>(),
          gh<_i57.UserUseCase>(),
        ));
    gh.factory<_i69.GroupRequestActionCubit>(
        () => _i69.GroupRequestActionCubit(groupUC: gh<_i46.GroupUseCase>()));
    gh.factory<_i70.LoginCubit>(
        () => _i70.LoginCubit(authUC: gh<_i60.AuthUseCase>()));
    gh.factory<_i71.SearchBloc>(
        () => _i71.SearchBloc(gh<_i54.SearchUseCase>()));
    gh.factory<_i72.SettingMainCubit>(() => _i72.SettingMainCubit(
          authUseCase: gh<_i60.AuthUseCase>(),
          userUseCase: gh<_i57.UserUseCase>(),
          appSettingsUseCase: gh<_i16.AppSettingsUseCase>(),
        ));
    gh.factory<_i73.SignUpCubit>(
        () => _i73.SignUpCubit(authUC: gh<_i60.AuthUseCase>()));
    gh.lazySingleton<_i74.AppBloc>(
        () => _i74.AppBloc(authUseCase: gh<_i60.AuthUseCase>()));
    return this;
  }
}
