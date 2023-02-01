import 'package:core/di/di_module.dart';
import 'package:core/network/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasources/local/data_manager.dart';
import '../data/datasources/remote/app_api/app_api.dart';
import '../data/repositories/app_repository/app_repository.dart';
import '../env/env.dart';
import '../presentation/common/language/cubit/language_cubit.dart';
import '../presentation/common/user/bloc/user_bloc.dart';

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
