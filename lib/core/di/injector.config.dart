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
import 'package:chatapp/data/data_sources/remote/base_service.dart' as _i7;
import 'package:chatapp/data/data_sources/remote/dio_interceptor.dart' as _i5;
import 'package:chatapp/data/data_sources/remote/service/auth_service.dart'
    as _i8;
import 'package:chatapp/data/repositories/auth_repository_impl.dart' as _i10;
import 'package:chatapp/domain/modules/auth/auth_repository.dart' as _i9;
import 'package:chatapp/domain/modules/auth/auth_usecase.dart' as _i11;
import 'package:chatapp/presentation/app/bloc/app_bloc.dart' as _i13;
import 'package:chatapp/presentation/auth/login/bloc/login_bloc.dart' as _i12;
import 'package:chatapp/presentation/setting/setting_main/cubit/setting_main_cubit.dart'
    as _i6;
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
    gh.factory<_i3.AuthFirebase>(() => _i3.AuthFirebase());
    gh.singleton<_i4.AuthLocalDataSrc>(_i4.AuthLocalDataSrc());
    gh.singleton<_i5.DioInterceptor>(
        _i5.DioInterceptor(gh<_i4.AuthLocalDataSrc>()));
    gh.factory<_i6.SettingMainCubit>(() => _i6.SettingMainCubit());
    gh.singleton<_i7.BaseService>(
        _i7.BaseService(interceptor: gh<_i5.DioInterceptor>()));
    gh.lazySingleton<_i8.AuthService>(
        () => _i8.AuthService(service: gh<_i7.BaseService>()));
    gh.factory<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
          authFirebase: gh<_i3.AuthFirebase>(),
          authService: gh<_i8.AuthService>(),
          authLocalDataSrc: gh<_i4.AuthLocalDataSrc>(),
        ));
    gh.factory<_i11.AuthUseCase>(
        () => _i11.AuthUseCaeImpl(repo: gh<_i9.AuthRepository>()));
    gh.factory<_i12.LoginBloc>(
        () => _i12.LoginBloc(authRepo: gh<_i9.AuthRepository>()));
    gh.lazySingleton<_i13.AppBloc>(
        () => _i13.AppBloc(authRepo: gh<_i9.AuthRepository>()));
    return this;
  }
}
