part of '../injection.dart';

class BlocModule extends DIModule {
  @override
  Future provides() async {
    getIt.registerSingleton<LanguageCubit>(
      LanguageCubit(
        defaultLanguage: getIt.get<DataManager>().getLanguage(),
        dataManager: getIt.get<DataManager>(),
      ),
    );
  }
}
