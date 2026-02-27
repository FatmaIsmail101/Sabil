import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../values/endpoints.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 10), // 10 ثواني كفاية جداً
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
