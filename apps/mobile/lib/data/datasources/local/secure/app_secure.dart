part of '../data_manager.dart';

abstract class AppSecure {
  Future writeAccessToken(String token);
  Future<String?> readAccessToken();
  void deleteAccessToken();

  void clearAll();

  static const String keyAccessToken = 'access_token';
}
