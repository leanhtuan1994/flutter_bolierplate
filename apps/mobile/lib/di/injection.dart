import 'package:core/di/di_module.dart';
import 'package:core/network/dio_client.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/data/datasources/local/data_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/data/datasources/remote/app_api/app_api.dart';
import 'package:mobile/data/repositories/app_repository/app_repository.dart';
import 'package:mobile/presentation/common/language/cubit/language_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'modules/api_module.dart';
part 'modules/bloc_module.dart';
part 'modules/component_module.dart';
part 'modules/repository_module.dart';

GetIt getIt = GetIt.instance;

class DependencyInjection {
  static Future inject() async {
    await ComponentModule().provides();
    await ApiModule().provides();
    await RepositoryModule().provides();
    await BlocModule().provides();
  }
}
