import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:chatapp/core/routes/app_navigation.dart';
import 'package:chatapp/core/routes/route_name.dart';
import 'package:chatapp/domain/modules/auth/auth_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'app_event.dart';
part 'app_state.dart';

@LazySingleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.authUseCase}) : super(AppLoading()) {
    on<AppUserChanged>(_onAppUserChanged);

    _appLinkSubscription = AppLinks().uriLinkStream.listen((uri) {
      UnAuthNavigationUtil.pushNamed(
          route: RouteName.forgotPassword,
          args: uri.queryParameters["urlCode"]);
    });

    _accessTokenSubscription = authUseCase.checkAccessTokenStream().listen(
      (event) {
        add(AppUserChanged());
      },
    );

    _refreshTokenSubscription = authUseCase.checkRefreshTokenStream().listen(
      (event) {
        add(AppUserChanged());
      },
    );

    add(AppUserChanged());
  }

  final AuthUseCase authUseCase;

  late final StreamSubscription<String?> _accessTokenSubscription;
  late final StreamSubscription<String?> _refreshTokenSubscription;
  late final StreamSubscription<Uri> _appLinkSubscription;

  Future<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {
    final isLoggedIn = await authUseCase.checkIsLoggedIn();

    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubscription.cancel();
    _refreshTokenSubscription.cancel();
    _appLinkSubscription.cancel();
    return super.close();
  }
}
