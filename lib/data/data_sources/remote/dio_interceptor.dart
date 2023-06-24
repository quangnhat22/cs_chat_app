import 'dart:developer';

import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:chatapp/data/data_sources/local/local_data_src.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'base_service.dart';

@Singleton()
class DioInterceptor {
  DioInterceptor(this._authLocal, this._localDataSrc);

  //_authService = authService;

  final AuthLocalDataSrc _authLocal;
  final LocalDataSrc _localDataSrc;

  //final AuthService _authService;

  Future<Dio> addInterceptor(Dio dio) async {
    //String query = "";
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: ((options, handler) async {
          final String? accessToken = await _authLocal.getAccessToken();
          options.headers
              .putIfAbsent('Authorization', () => 'Bearer $accessToken');
          handler.next(options);
        }),
        onResponse: ((response, handler) {
          handler.next(response);
        }),
        onError: (e, handler) async {
          if (e.requestOptions.path.contains("access-token") ||
              e.requestOptions.path.contains("login")) {
            return handler.next(e);
          }

          if (e.response?.statusCode == 401) {
            _handleAccessTokenExpired(dio);

            //recall request:
            final String? accessToken = await _authLocal.getAccessToken();
            e.requestOptions.headers
                .putIfAbsent('Authorization', () => 'Bearer $accessToken');
            final opts = Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            final cloneReq = await dio.request(e.requestOptions.path,
                options: opts,
                data: e.requestOptions.data,
                queryParameters: e.requestOptions.queryParameters);
            return handler.resolve(cloneReq);
          }
          handler.next(e);
        },
      ),
    );
    return dio;
  }

  Future<void> _handleAccessTokenExpired(Dio dio) async {
    try {
      final refreshToken = await _authLocal.getRefreshToken();
      if (refreshToken != null) {
        final res = await dio.post("${BaseService.authPath}/access-token",
            data: {"refresh_token": refreshToken});
        if (res.statusCode == 200) {
          final newAccessToken = res.data["data"]["token"];
          await _authLocal.saveAuth(
              accessToken: newAccessToken, refreshToken: refreshToken);
          // await _authLocal.set ;
        } else {
          _localDataSrc.deleteAll();
        }
      }
    } catch (_) {
      _localDataSrc.deleteAll();
    }
  }
}
