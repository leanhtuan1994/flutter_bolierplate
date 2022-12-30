part of '../data_manager.dart';

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({
    required this.sharedPreferences,
  });

  @override
  String getLanguage() {
    return sharedPreferences.getString(AppPreferences.keyLanguage) ?? Env.lang;
  }

  @override
  bool isFirstOpenApp() {
    return sharedPreferences.getBool(AppPreferences.firstOpen) ?? true;
  }

  @override
  void saveFirstOpenApp() {
    sharedPreferences.setBool(AppPreferences.firstOpen, false);
  }

  @override
  void saveLanguage(String languageCode) {
    sharedPreferences.setString(AppPreferences.keyLanguage, languageCode);
  }
}
