part of '../data_manager.dart';

class AppSecureImpl extends AppSecure {
  final FlutterSecureStorage secureStorage;

  AppSecureImpl({
    required this.secureStorage,
  });

  @override
  void clearAll() {
    secureStorage.deleteAll();
  }

  @override
  void deleteAccessToken() {
    secureStorage.delete(key: AppSecure.keyAccessToken);
  }

  @override
  Future<String?> readAccessToken() {
    return secureStorage.read(key: AppSecure.keyAccessToken);
  }

  @override
  Future writeAccessToken(String token) async {
    await secureStorage.write(key: AppSecure.keyAccessToken, value: token);
  }
}
