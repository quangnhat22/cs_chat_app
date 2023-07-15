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
import 'package:chatapp/data/data_sources/local/local_data_src.dart' as _i20;
import 'package:chatapp/data/data_sources/local/other_local_data_src.dart'
    as _i13;
import 'package:chatapp/data/data_sources/local/setting_local_data_src.dart'
    as _i14;
import 'package:chatapp/data/data_sources/local/user_local_data_src.dart'
    as _i15;
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i29;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i27;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i36;
import 'package:chatapp/data/data_sources/remote/service/device_service.dart'
    as _i30;
import 'package:chatapp/data/data_sources/remote/service/friend_service.dart'
    as _i31;
import 'package:chatapp/data/data_sources/remote/service/group_service.dart'
    as _i32;
import 'package:chatapp/data/data_sources/remote/service/notifications_service.dart'
    as _i33;
import 'package:chatapp/data/data_sources/remote/service/search_service.dart'
    as _i34;
import 'package:chatapp/data/data_sources/remote/service/user_service.dart'
    as _i35;
import 'package:chatapp/data/data_sources/web_socket/chat_web_socket.dart'
    as _i19;
import 'package:chatapp/data/data_sources/web_socket/new_message_socket.dart'
    as _i11;
import 'package:chatapp/data/repositories/app_settings_repo_impl.dart' as _i17;
import 'package:chatapp/data/repositories/auth_repo_impl.dart' as _i68;
import 'package:chatapp/data/repositories/chat_room_repo_impl.dart' as _i38;
import 'package:chatapp/data/repositories/device_repo_impl.dart' as _i41;
import 'package:chatapp/data/repositories/friend_repo_impl.dart' as _i44;
import 'package:chatapp/data/repositories/group_repo_impl.dart' as _i48;
import 'package:chatapp/data/repositories/message_repo_impl.dart' as _i22;
import 'package:chatapp/data/repositories/notification_repo_impl.dart' as _i58;
import 'package:chatapp/data/repositories/search_repo_impl.dart' as _i61;
import 'package:chatapp/data/repositories/user_repo_impl.dart' as _i64;
import 'package:chatapp/domain/modules/app_settings/app_settings_repository.dart'
    as _i16;
import 'package:chatapp/domain/modules/app_settings/app_settings_usecase.dart'
    as _i18;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i67;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i69;
import 'package:chatapp/domain/modules/chat_room/chat_room_repository.dart'
    as _i37;
import 'package:chatapp/domain/modules/chat_room/chat_room_use_case.dart'
    as _i39;
import 'package:chatapp/domain/modules/device/device_repository.dart' as _i40;
import 'package:chatapp/domain/modules/device/device_usecase.dart' as _i42;
import 'package:chatapp/domain/modules/friend/friend_repository.dart' as _i43;
import 'package:chatapp/domain/modules/friend/friend_usecase.dart' as _i45;
import 'package:chatapp/domain/modules/group/group_repository.dart' as _i47;
import 'package:chatapp/domain/modules/group/group_usecase.dart' as _i49;
import 'package:chatapp/domain/modules/message/message_repository.dart' as _i21;
import 'package:chatapp/domain/modules/message/message_usecase.dart' as _i23;
import 'package:chatapp/domain/modules/notification/notfication_repository.dart'
    as _i57;
import 'package:chatapp/domain/modules/notification/notification_usecase.dart'
    as _i59;
import 'package:chatapp/domain/modules/search/search_repository.dart' as _i60;
import 'package:chatapp/domain/modules/search/search_use_case.dart' as _i62;
import 'package:chatapp/domain/modules/user/user_repository.dart' as _i63;
import 'package:chatapp/domain/modules/user/user_usecase.dart' as _i65;
import 'package:chatapp/presentation/app/app_settings_cubit/app_settings_cubit.dart'
    as _i26;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i89;
import 'package:chatapp/presentation/app/cubit/app_notification_cubit.dart'
    as _i66;
import 'package:chatapp/presentation/auth/fogot_password/cubit_forgot_pasword/forgot_password_cubit.dart'
    as _i76;
import 'package:chatapp/presentation/auth/login/cubit_login/login_cubit.dart'
    as _i83;
import 'package:chatapp/presentation/auth/register/cubit_sign_up/sign_up_cubit.dart'
    as _i87;
import 'package:chatapp/presentation/chat/chat_main/bloc/list_chat_room_bloc.dart'
    as _i51;
import 'package:chatapp/presentation/chat/chat_room/chat_room_bloc/chat_room_bloc.dart'
    as _i70;
import 'package:chatapp/presentation/chat/chat_room/input_message_cubit/input_message_cubit.dart'
    as _i9;
import 'package:chatapp/presentation/chat/chat_room/message_stream_cubit/message_stream_cubit.dart'
    as _i28;
import 'package:chatapp/presentation/device/bloc/list_device_bloc.dart' as _i52;
import 'package:chatapp/presentation/friends/find_new_friend/bloc/find_friend_bloc.dart'
    as _i75;
import 'package:chatapp/presentation/friends/find_new_friend/cubit/find_friend_form_cubit.dart'
    as _i7;
import 'package:chatapp/presentation/friends/friends_contact/bloc/friends_contact_bloc.dart'
    as _i79;
import 'package:chatapp/presentation/friends/friends_detail/cubit/friend_detail_cubit.dart'
    as _i77;
import 'package:chatapp/presentation/friends/friends_infor/friend_action_cubit/friends_action_cubit.dart'
    as _i46;
import 'package:chatapp/presentation/friends/friends_infor/friend_info_cubit/friend_info_cubit.dart'
    as _i8;
import 'package:chatapp/presentation/friends/friends_request/friend_request_action_cubit/friend_request_action_cubit.dart'
    as _i78;
import 'package:chatapp/presentation/friends/friends_request/list_friend_request_bloc/list_friend_request_bloc.dart'
    as _i53;
import 'package:chatapp/presentation/group/create_group/cubit_create_group_form/create_group_cubit.dart'
    as _i5;
import 'package:chatapp/presentation/group/create_group/cubit_group/cubit_submit_new_group_cubit.dart'
    as _i71;
import 'package:chatapp/presentation/group/edit_group/cubit/edit_group_cubit.dart'
    as _i73;
import 'package:chatapp/presentation/group/group_details/bloc/group_details_bloc.dart'
    as _i80;
import 'package:chatapp/presentation/group/groups_request/bloc/list_group_request_bloc.dart'
    as _i55;
import 'package:chatapp/presentation/group/groups_request/cubit/group_request_action_cubit.dart'
    as _i81;
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_member/invite_new_member_cubit.dart'
    as _i50;
import 'package:chatapp/presentation/group/invite_member_group/cubit_invite_new_member_form/invite_new_member_form_cubit.dart'
    as _i10;
import 'package:chatapp/presentation/group/list_member_group/cubit/list_member_cubit.dart'
    as _i82;
import 'package:chatapp/presentation/group/your_groups/bloc/list_group_bloc.dart'
    as _i54;
import 'package:chatapp/presentation/media/cubit/media_cubit.dart' as _i56;
import 'package:chatapp/presentation/notification/bloc/notification_bloc.dart'
    as _i84;
import 'package:chatapp/presentation/search/bloc/search_bloc.dart' as _i85;
import 'package:chatapp/presentation/setting/edit_profile/bloc/edit_form_submit_bloc.dart'
    as _i72;
import 'package:chatapp/presentation/setting/edit_profile/edit_profile_form_cubit/edit_profile_form_cubit.dart'
    as _i74;
import 'package:chatapp/presentation/setting/setting_language/cubit/setting_language_cubit.dart'
    as _i24;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i86;
import 'package:chatapp/presentation/setting/setting_theme/cubit/setting_theme_cubit.dart'
    as _i25;
import 'package:chatapp/presentation/setting/update_password/cubit/update_password_form_dart_cubit.dart'
    as _i88;
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
    gh.factory<_i10.InviteNewMemberFormCubit>(
        () => _i10.InviteNewMemberFormCubit());
    gh.factory<_i11.NewMessageSocket>(
        () => _i11.NewMessageSocket(gh<_i4.AuthLocalDataSrc>()));
    gh.singleton<_i12.NotificationService>(_i12.NotificationService());
    gh.singleton<_i13.OtherLocalDataSrc>(_i13.OtherLocalDataSrc());
    gh.singleton<_i14.SettingLocalDataSrc>(_i14.SettingLocalDataSrc());
    gh.singleton<_i15.UserLocalDataSrc>(_i15.UserLocalDataSrc());
    gh.factory<_i16.AppSettingsRepository>(() => _i17.AppSettingsRepositoryImpl(
        localDataSrc: gh<_i14.SettingLocalDataSrc>()));
    gh.factory<_i18.AppSettingsUseCase>(() =>
        _i18.AppSettingsUseCaseImpl(repo: gh<_i16.AppSettingsRepository>()));
    gh.factory<_i19.ChatWebSocket>(() => _i19.ChatWebSocket(
          localDataSrc: gh<_i4.AuthLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.singleton<_i20.LocalDataSrc>(_i20.LocalDataSrc(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i14.SettingLocalDataSrc>(),
      gh<_i15.UserLocalDataSrc>(),
      gh<_i13.OtherLocalDataSrc>(),
    ));
    gh.factory<_i21.MessageRepository>(() =>
        _i22.MessageRepositoryImpl(chatWebSocket: gh<_i19.ChatWebSocket>()));
    gh.factory<_i23.MessageUseCase>(
        () => _i23.MessageUseCaseImpl(repo: gh<_i21.MessageRepository>()));
    gh.factory<_i24.SettingLanguageCubit>(() =>
        _i24.SettingLanguageCubit(usecase: gh<_i18.AppSettingsUseCase>()));
    gh.factory<_i25.SettingThemeCubit>(
        () => _i25.SettingThemeCubit(usecase: gh<_i18.AppSettingsUseCase>()));
    gh.factory<_i26.AppSettingsCubit>(
        () => _i26.AppSettingsCubit(useCase: gh<_i18.AppSettingsUseCase>()));
    gh.singleton<_i27.DioInterceptor>(_i27.DioInterceptor(
      gh<_i4.AuthLocalDataSrc>(),
      gh<_i20.LocalDataSrc>(),
    ));
    gh.factory<_i28.MessageStreamCubit>(
        () => _i28.MessageStreamCubit(messageUC: gh<_i23.MessageUseCase>()));
    gh.singleton<_i29.BaseService>(
        _i29.BaseService(interceptor: gh<_i27.DioInterceptor>()));
    gh.factory<_i30.DeviceService>(
        () => _i30.DeviceService(service: gh<_i29.BaseService>()));
    gh.factory<_i31.FriendService>(
        () => _i31.FriendService(service: gh<_i29.BaseService>()));
    gh.factory<_i32.GroupService>(
        () => _i32.GroupService(service: gh<_i29.BaseService>()));
    gh.factory<_i33.NotificationsService>(() => _i33.NotificationsService(
          gh<_i29.BaseService>(),
          gh<_i13.OtherLocalDataSrc>(),
        ));
    gh.factory<_i34.SearchService>(
        () => _i34.SearchService(service: gh<_i29.BaseService>()));
    gh.lazySingleton<_i35.UserService>(
        () => _i35.UserService(service: gh<_i29.BaseService>()));
    gh.lazySingleton<_i36.AuthService>(() => _i36.AuthService(
          gh<_i29.BaseService>(),
          gh<_i13.OtherLocalDataSrc>(),
        ));
    gh.factory<_i37.ChatRoomRepository>(() => _i38.ChatRoomRepoImpl(
          gh<_i32.GroupService>(),
          gh<_i11.NewMessageSocket>(),
        ));
    gh.factory<_i39.ChatRoomUseCase>(
        () => _i39.ChatRoomUseCaseImpl(gh<_i37.ChatRoomRepository>()));
    gh.factory<_i40.DeviceRepository>(
        () => _i41.DeviceRepoImpl(deviceService: gh<_i30.DeviceService>()));
    gh.factory<_i42.DeviceUseCase>(
        () => _i42.DeviceUseCaseImpl(deviceRepo: gh<_i40.DeviceRepository>()));
    gh.factory<_i43.FriendRepository>(
        () => _i44.FriendRepositoryImpl(service: gh<_i31.FriendService>()));
    gh.factory<_i45.FriendUseCase>(
        () => _i45.FriendUseCaseImpl(repo: gh<_i43.FriendRepository>()));
    gh.factory<_i46.FriendsActionCubit>(
        () => _i46.FriendsActionCubit(friendUC: gh<_i45.FriendUseCase>()));
    gh.factory<_i47.GroupRepository>(() => _i48.GroupRepoImpl(
          groupService: gh<_i32.GroupService>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i49.GroupUseCase>(
        () => _i49.GroupUseCaseImpl(groupRepo: gh<_i47.GroupRepository>()));
    gh.factory<_i50.InviteNewMemberCubit>(() => _i50.InviteNewMemberCubit(
          gh<_i49.GroupUseCase>(),
          gh<_i45.FriendUseCase>(),
        ));
    gh.factory<_i51.ListChatRoomBloc>(
        () => _i51.ListChatRoomBloc(gh<_i39.ChatRoomUseCase>()));
    gh.factory<_i52.ListDeviceBloc>(
        () => _i52.ListDeviceBloc(deviceUC: gh<_i42.DeviceUseCase>()));
    gh.factory<_i53.ListFriendRequestBloc>(() =>
        _i53.ListFriendRequestBloc(friendUseCase: gh<_i45.FriendUseCase>()));
    gh.factory<_i54.ListGroupBloc>(
        () => _i54.ListGroupBloc(gh<_i39.ChatRoomUseCase>()));
    gh.factory<_i55.ListGroupRequestBloc>(
        () => _i55.ListGroupRequestBloc(groupUseCase: gh<_i49.GroupUseCase>()));
    gh.factory<_i56.MediaCubit>(
        () => _i56.MediaCubit(gh<_i39.ChatRoomUseCase>()));
    gh.factory<_i57.NotificationRepository>(
        () => _i58.NotificationRepositoryImpl(
              gh<_i33.NotificationsService>(),
              gh<_i12.NotificationService>(),
              gh<_i30.DeviceService>(),
            ));
    gh.factory<_i59.NotificationUseCase>(
        () => _i59.NotificationUseCaseImpl(gh<_i57.NotificationRepository>()));
    gh.factory<_i60.SearchRepository>(
        () => _i61.SearchRepositoryImpl(service: gh<_i34.SearchService>()));
    gh.factory<_i62.SearchUseCase>(
        () => _i62.SearchUseCaseImpl(repo: gh<_i60.SearchRepository>()));
    gh.factory<_i63.UserRepository>(() => _i64.UserRepositoryImpl(
          service: gh<_i35.UserService>(),
          local: gh<_i15.UserLocalDataSrc>(),
          storageFirebase: gh<_i6.FileStorageFirebase>(),
        ));
    gh.factory<_i65.UserUseCase>(
        () => _i65.UserUseCaseImpl(repo: gh<_i63.UserRepository>()));
    gh.singleton<_i66.AppNotificationCubit>(_i66.AppNotificationCubit(
      gh<_i45.FriendUseCase>(),
      gh<_i49.GroupUseCase>(),
    ));
    gh.factory<_i67.AuthRepository>(() => _i68.AuthRepositoryImpl(
          gh<_i3.AuthFirebase>(),
          gh<_i36.AuthService>(),
          gh<_i63.UserRepository>(),
          gh<_i4.AuthLocalDataSrc>(),
          gh<_i20.LocalDataSrc>(),
          gh<_i12.NotificationService>(),
        ));
    gh.factory<_i69.AuthUseCase>(
        () => _i69.AuthUseCaeImpl(repo: gh<_i67.AuthRepository>()));
    gh.factory<_i70.ChatRoomBloc>(
        () => _i70.ChatRoomBloc(gh<_i39.ChatRoomUseCase>()));
    gh.factory<_i71.CubitSubmitNewGroupCubit>(
        () => _i71.CubitSubmitNewGroupCubit(gh<_i49.GroupUseCase>()));
    gh.factory<_i72.EditFormSubmitBloc>(
        () => _i72.EditFormSubmitBloc(userUseCase: gh<_i65.UserUseCase>()));
    gh.factory<_i73.EditGroupCubit>(
        () => _i73.EditGroupCubit(gh<_i49.GroupUseCase>()));
    gh.factory<_i74.EditProfileFormCubit>(
        () => _i74.EditProfileFormCubit(userUseCase: gh<_i65.UserUseCase>()));
    gh.factory<_i75.FindFriendBloc>(
        () => _i75.FindFriendBloc(userRepo: gh<_i63.UserRepository>()));
    gh.factory<_i76.ForgotPasswordCubit>(
        () => _i76.ForgotPasswordCubit(gh<_i69.AuthUseCase>()));
    gh.factory<_i77.FriendDetailCubit>(() => _i77.FriendDetailCubit(
          gh<_i39.ChatRoomUseCase>(),
          gh<_i65.UserUseCase>(),
        ));
    gh.factory<_i78.FriendRequestActionCubit>(() =>
        _i78.FriendRequestActionCubit(friendUseCase: gh<_i45.FriendUseCase>()));
    gh.factory<_i79.FriendsContactBloc>(() => _i79.FriendsContactBloc(
          gh<_i45.FriendUseCase>(),
          gh<_i65.UserUseCase>(),
        ));
    gh.factory<_i80.GroupDetailsBloc>(() => _i80.GroupDetailsBloc(
          gh<_i39.ChatRoomUseCase>(),
          gh<_i49.GroupUseCase>(),
        ));
    gh.factory<_i81.GroupRequestActionCubit>(
        () => _i81.GroupRequestActionCubit(groupUC: gh<_i49.GroupUseCase>()));
    gh.factory<_i82.ListMemberCubit>(
        () => _i82.ListMemberCubit(gh<_i65.UserUseCase>()));
    gh.factory<_i83.LoginCubit>(
        () => _i83.LoginCubit(authUC: gh<_i69.AuthUseCase>()));
    gh.factory<_i84.NotificationBloc>(() => _i84.NotificationBloc(
          gh<_i59.NotificationUseCase>(),
          gh<_i45.FriendUseCase>(),
          gh<_i49.GroupUseCase>(),
        ));
    gh.factory<_i85.SearchBloc>(
        () => _i85.SearchBloc(gh<_i62.SearchUseCase>()));
    gh.factory<_i86.SettingMainCubit>(() => _i86.SettingMainCubit(
          authUseCase: gh<_i69.AuthUseCase>(),
          userUseCase: gh<_i65.UserUseCase>(),
          appSettingsUseCase: gh<_i18.AppSettingsUseCase>(),
        ));
    gh.factory<_i87.SignUpCubit>(
        () => _i87.SignUpCubit(authUC: gh<_i69.AuthUseCase>()));
    gh.factory<_i88.UpdatePasswordFormDartCubit>(() =>
        _i88.UpdatePasswordFormDartCubit(authUseCase: gh<_i69.AuthUseCase>()));
    gh.lazySingleton<_i89.AppBloc>(() => _i89.AppBloc(
          gh<_i69.AuthUseCase>(),
          gh<_i65.UserUseCase>(),
        ));
    return this;
  }
}
