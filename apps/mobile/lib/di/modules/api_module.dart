part of '../injection.dart';

class ApiModule extends DIModule {
  @override
  Future provides() async {
    final dio = await DioClient.setup(
      baseUrl: Env.baseUrl,
    );

    getIt.registerSingleton<AppApi>(AppApi(dio));
  }
}
