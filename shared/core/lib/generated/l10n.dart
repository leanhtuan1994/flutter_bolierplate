// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class SCore {
  SCore();

  static SCore? _current;

  static SCore get current {
    assert(_current != null,
        'No instance of SCore was loaded. Try to initialize the SCore delegate before accessing SCore.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<SCore> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = SCore();
      SCore._current = instance;

      return instance;
    });
  }

  static SCore of(BuildContext context) {
    final instance = SCore.maybeOf(context);
    assert(instance != null,
        'No instance of SCore present in the widget tree. Did you add SCore.delegate in localizationsDelegates?');
    return instance!;
  }

  static SCore? maybeOf(BuildContext context) {
    return Localizations.of<SCore>(context, SCore);
  }

  /// `Something went wrong, please try again!`
  String get networkFailed {
    return Intl.message(
      'Something went wrong, please try again!',
      name: 'networkFailed',
      desc: '',
      args: [],
    );
  }

  /// `An error has occurred`
  String get loadFail {
    return Intl.message(
      'An error has occurred',
      name: 'loadFail',
      desc: '',
      args: [],
    );
  }

  /// `loading...`
  String get loadMore {
    return Intl.message(
      'loading...',
      name: 'loadMore',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<SCore> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<SCore> load(Locale locale) => SCore.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
