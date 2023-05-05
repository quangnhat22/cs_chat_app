import 'dart:async';
import 'dart:developer';

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

    _accessTokenSubscription = authUseCase.checkAccessTokenStream().listen(
      (event) {
        log(event.toString(), name: "eventAccessRefresh");
        add(AppUserChanged());
      },
    );

    _refreshTokenSubscription = authUseCase.checkAccessTokenStream().listen(
      (event) {
        log(event.toString(), name: "eventRefresh");
        add(AppUserChanged());
      },
    );

    add(AppUserChanged());
  }


  final AuthUseCase authUseCase;

  late final StreamSubscription<String?> _accessTokenSubscription;
  late final StreamSubscription<String?> _refreshTokenSubscription;

  Future<void> _onAppUserChanged(
      AppUserChanged event, Emitter<AppState> emit) async {

    final isLoggedIn = await authUseCase.checkIsLoggedIn();

    emit(isLoggedIn ? AppAuthorized() : AppUnAuthorized());
  }

  @override
  Future<void> close() {
    _accessTokenSubscription.cancel();
    _refreshTokenSubscription.cancel();
    return super.close();
  }
}
