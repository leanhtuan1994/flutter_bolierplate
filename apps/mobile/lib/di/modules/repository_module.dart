part of '../injection.dart';

class RepositoryModule extends DIModule {
  @override
  Future provides() async {
    getIt.registerFactory<AppRepository>(
      () => AppRepositoryImpl(
        api: getIt.get<AppApi>(),
      ),
    );
  }
}
