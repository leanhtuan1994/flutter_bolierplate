import 'dart:async';

import 'package:dio/dio.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setup() async {
    final options = BaseOptions();

    _dio = Dio(options);

    return _dio;
  }

  static void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  static Dio get dio => _dio;
}
