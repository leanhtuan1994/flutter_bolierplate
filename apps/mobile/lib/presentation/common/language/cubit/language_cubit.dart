import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:mobile/data/datasources/local/data_manager.dart';
part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final String defaultLanguage;
  final DataManager dataManager;

  LanguageCubit({
    required this.defaultLanguage,
    required this.dataManager,
  }) : super(LanguageState(language: defaultLanguage));

  void updateLanguage({required String lang}) {
    try {
      dataManager.saveLanguage(lang);
      emit(state.copyWith(language: lang));
    } catch (err) {
      emit(
        state.copyWith(language: defaultLanguage),
      );
    }
  }

  String get currentLanguage => state.language;
}
