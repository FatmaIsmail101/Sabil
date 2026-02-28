import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../values/endpoints.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    );

    return dio;
  }
}

// @module
// abstract class DioModule {
//   @singleton
//   Dio get dio => Dio(
//     BaseOptions(
//       baseUrl: Endpoints.baseUrl,
//       connectTimeout: const Duration(seconds: 10), // 10 ثواني كفاية جداً
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   )..interceptors.add(PrettyDioLogger());
// }
