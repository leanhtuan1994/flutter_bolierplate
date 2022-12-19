import 'dart:async';

import 'package:dio/dio.dart';

class DioClient {
  static late Dio _dio;

  static FutureOr<Dio> setup(
      {String? baseUrl, List<Interceptor> interceptors = const []}) async {
    final options = BaseOptions(
      responseType: ResponseType.json,
      baseUrl: baseUrl ?? "",
    );

    _dio = Dio(options);

    _dio.interceptors.addAll(interceptors);

    return _dio;
  }

  static Dio get dio => _dio;
}
