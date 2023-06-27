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
import 'package:chatapp/data/data_sources/local/local_data_src.dart' as _i19;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i13;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i14;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i28;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i26;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i34;
import 'package:chatapp/data/data_sources/remote/service/device_service.dart'
    as _i29;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i30;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i31;
import 'package:chatapp/data/data_sources/remote/service/search_service.dart'
    as _i32;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i33;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i18;
import 'package:chatapp/data/data_sources/web_socket/new_message_socket.dart'
    as _i10;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i16;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i61;
import 'package:chatapp/data/repositories/chat_room_repo_impl.dart' as _i36;
import 'package:chatapp/data/repositories/device_repo_impl.dart' as _i39;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i42;
import 'package:chatapp/data/repositories/group_repo_impl.dart' as _i46;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i21;
import 'package:chatapp/data/repositories/search_repo_impl.dart' as _i55;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i58;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i15;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i17;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i60;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i62;
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart'
    as _i35;
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart'
    as _i37;
import 'package:chatapp/domain/modules/device/device_repository.dart' as _i38;
import 'package:chatapp/domain/modules/device/device_usecase.dart' as _i40;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i41;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i43;
import 'package:chatapp/domain/modules/group/group_repository.dart' as _i45;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i47;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i20;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i22;
import 'package:chatapp/domain/modules/search/search_repository.dart' as _i54;
import 'package:chatapp/domain/modules/search/search_use_case.dart' as _i56;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i57;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i59;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i25;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i79;
import 'package:chatapp/presentation/auth/fogot_password/cubit_forgot_pasword/forgot_password_cubit.dart'
    as _i69;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i75;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i78;
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart'
    as _i48;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i63;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i9;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i27;
import 'package:chatapp/presentation/device/bloc/list_device_bloc.dart' as _i49;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i68;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i72;
import 'package:chatapp/presentation/friends/friends_detail/cubit/friend_detail_cubit.dart'
    as _i70;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i44;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i71;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i50;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i64;
import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart'
    as _i66;
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart'
    as _i73;
import 'package:chatapp/presentation/group/groups_request/bloc/list_group_request_bloc.dart'
    as _i52;
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart'
    as _i74;
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart'
    as _i51;
import 'package:chatapp/presentation/media/cubit/media_cubit.dart' as _i53;
import 'package:chatapp/presentation/search/bloc/search_bloc.dart' as _i76;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i65;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i67;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i23;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i77;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i24;
import 'package:chatapp/service/notification_controller.dart' as _i11;
import 'package:chatapp/service/notification_service.dart' as _i12;
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
    gh.factory<_i10.NewMessageSocket>(
        () => _i10.NewMessageSocket(gh<_i4.AuthLocalDataSrc>()));
    gh.factory<_i11.NotificationController>(
        () => _i11.NotificationController());
    gh.singleton<_i12.NotificationService>(_i12.NotificationService());
    gh.singleton<_i13.SettingLocalDataSrc>(_i13.SettingLocalDataSrc());
    gh.singleton<_i14.UserLocalDataSrc>(_i14.UserLocalDataSrc());
    gh.factory<_i15.AppSettingsRepository>(() => _i16.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i13.SettingLocalDataSrc>()));
    gh.factory<_i17.AppSettingsUseCase>(() =>
        _i17.AppSettingsUseCaseImpl(repo: gh<_i15.AppSettingsRepository>()));
    gh.factory<_i18.ChatWebSocket>(() => _i18.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.singleton<_i19.LocalDataSrc>(_i19.LocalDataSrc(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i13.SettingLocalDataSrc>(),
      gh<_i14.UserLocalDataSrc>(),
    ));
    gh.factory<_i20.MessageRepository>(() =>
        _i21.MessageRepositoryImpl(chatWebSocket: gh<_i18.ChatWebSocket>()));
    gh.factory<_i22.MessageUseCase>(
        () => _i22.MessageUseCaseImpl(repo: gh<_i20.MessageRepository>()));
    gh.factory<_i23.SettingLanguageCubit>(() =>
        _i23.SettingLanguageCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i24.SettingThemeCubit>(
        () => _i24.SettingThemeCubit(usecase: gh<_i17.AppSettingsUseCase>()));
    gh.factory<_i25.AppSettingsCubit>(
        () => _i25.AppSettingsCubit(useCase: gh<_i17.AppSettingsUseCase>()));
    gh.singleton<_i26.DioInterceptor>(_i26.DioInterceptor(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i19.LocalDataSrc>(),
    ));
    gh.factory<_i27.MessageStreamCubit>(
        () => _i27.MessageStreamCubit(messageUC: gh<_i22.MessageUseCase>()));
    gh.singleton<_i28.BaseService>(
        _i28.BaseService(interceptor: gh<_i26.DioInterceptor>()));
    gh.factory<_i29.DeviceService>(
        () => _i29.DeviceService(service: gh<_i28.BaseService>()));
    gh.factory<_i30.FriendService>(
        () => _i30.FriendService(service: gh<_i28.BaseService>()));
    gh.factory<_i31.GroupService>(
        () => _i31.GroupService(service: gh<_i28.BaseService>()));
    gh.factory<_i32.SearchService>(
        () => _i32.SearchService(service: gh<_i28.BaseService>()));
    gh.lazySingleton<_i33.UserService>(
        () => _i33.UserService(service: gh<_i28.BaseService>()));
    gh.lazySingleton<_i34.AuthService>(
        () => _i34.AuthService(service: gh<_i28.BaseService>()));
    gh.factory<_i35.ChatRoomRepository>(() => _i36.ChatRoomRepoImpl(
          gh<_i31.GroupService>(),
          gh<_i10.NewMessageSocket>(),
        ));
    gh.factory<_i37.ChatRoomUseCase>(
        () => _i37.ChatRoomUseCaseImpl(gh<_i35.ChatRoomRepository>()));
    gh.factory<_i38.DeviceRepository>(
        () => _i39.DeviceRepoImpl(deviceService: gh<_i29.DeviceService>()));
    gh.factory<_i40.DeviceUseCase>(
        () => _i40.DeviceUseCaseImpl(deviceRepo: gh<_i38.DeviceRepository>()));
    gh.factory<_i41.FriendRepository>(
        () => _i42.FriendRepositoryImpl(service: gh<_i30.FriendService>()));
    gh.factory<_i43.FriendUseCase>(
        () => _i43.FriendUseCaseImpl(repo: gh<_i41.FriendRepository>()));
    gh.factory<_i44.FriendsActionCubit>(
        () => _i44.FriendsActionCubit(friendUC: gh<_i43.FriendUseCase>()));
    gh.factory<_i45.GroupRepository>(() => _i46.GroupRepoImpl(
          groupService: gh<_i31.GroupService>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i47.GroupUseCase>(
        () => _i47.GroupUseCaseImpl(groupRepo: gh<_i45.GroupRepository>()));
    gh.factory<_i48.ListChatRoomBloc>(
        () => _i48.ListChatRoomBloc(gh<_i37.ChatRoomUseCase>()));
    gh.factory<_i49.ListDeviceBloc>(
        () => _i49.ListDeviceBloc(deviceUC: gh<_i40.DeviceUseCase>()));
    gh.factory<_i50.ListFriendRequestBloc>(() =>
        _i50.ListFriendRequestBloc(friendUseCase: gh<_i43.FriendUseCase>()));
    gh.factory<_i51.ListGroupBloc>(
        () => _i51.ListGroupBloc(gh<_i37.ChatRoomUseCase>()));
    gh.factory<_i52.ListGroupRequestBloc>(
        () => _i52.ListGroupRequestBloc(groupUseCase: gh<_i47.GroupUseCase>()));
    gh.factory<_i53.MediaCubit>(
        () => _i53.MediaCubit(gh<_i37.ChatRoomUseCase>()));
    gh.factory<_i54.SearchRepository>(
        () => _i55.SearchRepositoryImpl(service: gh<_i32.SearchService>()));
    gh.factory<_i56.SearchUseCase>(
        () => _i56.SearchUseCaseImpl(repo: gh<_i54.SearchRepository>()));
    gh.factory<_i57.UserRepository>(() => _i58.UserRepositoryImpl(
          service: gh<_i33.UserService>(),
          local: gh<_i14.UserLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i59.UserUseCase>(
        () => _i59.UserUseCaseImpl(repo: gh<_i57.UserRepository>()));
    gh.factory<_i60.AuthRepository>(() => _i61.AuthRepositoryImpl(
          gh<_i3.AuthFirebase>(),
          gh<_i34.AuthService>(),
          gh<_i57.UserRepository>(),
          gh<_i4.AuthLocalDataSrc>(),
          gh<_i19.LocalDataSrc>(),
          gh<_i12.NotificationService>(),
        ));
    gh.factory<_i62.AuthUseCase>(
        () => _i62.AuthUseCaeImpl(repo: gh<_i60.AuthRepository>()));
    gh.factory<_i63.ChatRoomBloc>(() => _i63.ChatRoomBloc(
          gh<_i59.UserUseCase>(),
          gh<_i37.ChatRoomUseCase>(),
        ));
    gh.factory<_i64.CubitSubmitNewGroupCubit>(
        () => _i64.CubitSubmitNewGroupCubit(gh<_i47.GroupUseCase>()));
    gh.factory<_i65.EditFormSubmitBloc>(
        () => _i65.EditFormSubmitBloc(userUseCase: gh<_i59.UserUseCase>()));
    gh.factory<_i66.EditGroupCubit>(
        () => _i66.EditGroupCubit(gh<_i47.GroupUseCase>()));
    gh.factory<_i67.EditProfileFormCubit>(
        () => _i67.EditProfileFormCubit(userUseCase: gh<_i59.UserUseCase>()));
    gh.factory<_i68.FindFriendBloc>(
        () => _i68.FindFriendBloc(userRepo: gh<_i57.UserRepository>()));
    gh.factory<_i69.ForgotPasswordCubit>(
        () => _i69.ForgotPasswordCubit(gh<_i62.AuthUseCase>()));
    gh.factory<_i70.FriendDetailCubit>(() => _i70.FriendDetailCubit(
          gh<_i37.ChatRoomUseCase>(),
          gh<_i59.UserUseCase>(),
        ));
    gh.factory<_i71.FriendRequestActionCubit>(() =>
        _i71.FriendRequestActionCubit(friendUseCase: gh<_i43.FriendUseCase>()));
    gh.factory<_i72.FriendsContactBloc>(() => _i72.FriendsContactBloc(
          gh<_i43.FriendUseCase>(),
          gh<_i59.UserUseCase>(),
        ));
    gh.factory<_i73.GroupDetailsBloc>(() => _i73.GroupDetailsBloc(
          gh<_i37.ChatRoomUseCase>(),
          gh<_i47.GroupUseCase>(),
        ));
    gh.factory<_i74.GroupRequestActionCubit>(
        () => _i74.GroupRequestActionCubit(groupUC: gh<_i47.GroupUseCase>()));
    gh.factory<_i75.LoginCubit>(
        () => _i75.LoginCubit(authUC: gh<_i62.AuthUseCase>()));
    gh.factory<_i76.SearchBloc>(
        () => _i76.SearchBloc(gh<_i56.SearchUseCase>()));
    gh.factory<_i77.SettingMainCubit>(() => _i77.SettingMainCubit(
          authUseCase: gh<_i62.AuthUseCase>(),
          userUseCase: gh<_i59.UserUseCase>(),
          appSettingsUseCase: gh<_i17.AppSettingsUseCase>(),
        ));
    gh.factory<_i78.SignUpCubit>(
        () => _i78.SignUpCubit(authUC: gh<_i62.AuthUseCase>()));
    gh.lazySingleton<_i79.AppBloc>(
        () => _i79.AppBloc(authUseCase: gh<_i62.AuthUseCase>()));
    return this;
  }
}
