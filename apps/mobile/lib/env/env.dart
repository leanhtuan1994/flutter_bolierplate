import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'APP_NAME')
  static const appName = _Env.appName;

  @EnviedField(varName: 'BASE_URL')
  static const baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'LANG', defaultValue: 'en')
  static const lang = _Env.lang;
}
