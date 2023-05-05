
import 'dart:developer';

import 'package:chatapp/data/data_sources/local/auth_local_data_src.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class DioInterceptor {
  DioInterceptor(this._authLocalDataSrc);

  final AuthLocalDataSrc _authLocalDataSrc;

  Future<Dio> addInterceptor(Dio dio) async {
    //String query = "";
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: ((options, handler) async {
          final String? accessToken = await _authLocalDataSrc.getAccessToken();
          options.headers
              .putIfAbsent('Authorization', () => 'Bearer $accessToken');
          handler.next(options);
        }),
        onResponse: ((response, handler) async {
          if (response.statusCode == 401) {
            //dio.interceptors.req
          }
          handler.next(response);
        }),
        onError: (e, handler) {
          log(e.toString(), name: "API Error");
        },
      ),
    );
    return dio;
  }

  // static Future<Dio> addInterceptorRefreshToken(Dio dio) async {
  //   dio.interceptors.add(
  //     QueuedInterceptorsWrapper(
  //       onRequest: ((options, handler) async {
  //         options.headers["uuid"] = "abc";
  //         options.headers["platform"] = "userApp";
  //         options.headers["refreshToken"] = await HiveAuth().getRefreshToken();
  //         handler.next(options);
  //       }),
  //       onResponse: ((response, handler) async {
  //         //save new access token and refresh token
  //         final String newAccessToken = response.headers["newaccesstoken"]![0];
  //         final String newRefreshToken =
  //             response.headers["newrefreshtoken"]![0];
  //         await HiveAuth().saveAuth(newAccessToken, newRefreshToken);
  //         handler.next(response);
  //       }),
  //     ),
  //   );
  //   return dio;
  // }
}
