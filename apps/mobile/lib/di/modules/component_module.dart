part of '../injection.dart';

class ComponentModule extends DIModule {
  @override
  Future provides() async {
    getIt.registerSingleton<DataManager>(
      DataManagerImpl(
        appPreferences: AppPreferencesImpl(
          sharedPreferences: await SharedPreferences.getInstance(),
        ),
        appSecure: AppSecureImpl(
          secureStorage: const FlutterSecureStorage(),
        ),
      ),
    );
  }
}
