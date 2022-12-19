import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './data_manager_impl.dart';
part './prefs/app_preferences.dart';
part './prefs/app_preferences_impl.dart';
part './secure/app_secure.dart';
part './secure/app_secure_impl.dart';

abstract class DataManager implements AppPreferences, AppSecure {}
