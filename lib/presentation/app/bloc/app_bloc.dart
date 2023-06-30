import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/domain/entities/user_entity.dart';
import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:chatapp/domain/modules/user/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;

  AppBloc(this._authUseCase, this._userUseCase) : super(AppLoading()) {
    on<AppStarted>(_onAppStarted);
    on<AppUserChanged>(_onAppUserChanged);

    _appLinkSubscription = AppLinks().uriLinkStream.listen((uri) {
      UnAuthNavigationUtil.pushNamed(
          route: RouteName.forgotPassword,
          args: uri.queryParameters["urlCode"]);
    });

    _accessTokenSubscription = _authUseCase.checkAccessTokenStream().listen(
      (event) {
        add(AppUserChanged());
      },
    );

    _refreshTokenSubscription = _authUseCase.checkRefreshTokenStream().listen(
      (event) {
        add(AppUserChanged());
      },
    );

    _userSubscription = _userUseCase.getStreamSelfFromLocal().listen(
      (userModel) {
        if (userModel == null) return;
        if (!userModel.profileUpdated) {
          NavigationUtil.pushNamed(route: RouteName.editProfile);
        }
      },
    );

    add(AppUserChanged());
  }

  late final StreamSubscription<String?> _accessTokenSubscription;
  late final StreamSubscription<String?> _refreshTokenSubscription;
  late final StreamSubscription<UserEntity?> _userSubscription;
  late final StreamSubscription<Uri> _appLinkSubscription;

  void _onAppStarted(AppStarted event, Emitter<AppState> emit) {
    //getIt<NotificationController>().initializeNotificationsEventListeners();
  }

  Future<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    final isLoggedIn = await _authUseCase.checkIsLoggedIn();

    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubscription.cancel();
    _refreshTokenSubscription.cancel();
    _appLinkSubscription.cancel();
    _userSubscription.cancel();
    return super.close();
  }
}
