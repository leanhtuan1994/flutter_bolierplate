part of 'data_manager.dart';

class DataManagerImpl extends DataManager {
  final AppPreferences appPreferences;
  final AppSecure appSecure;

  DataManagerImpl({
    required this.appPreferences,
    required this.appSecure,
  });

  @override
  void clearAll() {
    appSecure.clearAll();
  }

  @override
  void deleteAccessToken() {
    appSecure.deleteAccessToken();
  }

  @override
  Future<String?> readAccessToken() {
    return appSecure.readAccessToken();
  }

  @override
  Future writeAccessToken(String token) {
    return appSecure.writeAccessToken(token);
  }

  @override
  String getLanguage() {
    return appPreferences.getLanguage();
  }

  @override
  bool isFirstOpenApp() {
    return appPreferences.isFirstOpenApp();
  }

  @override
  void saveFirstOpenApp() {
    appPreferences.saveFirstOpenApp();
  }

  @override
  void saveLanguage(String languageCode) {
    appPreferences.saveLanguage(languageCode);
  }
}
