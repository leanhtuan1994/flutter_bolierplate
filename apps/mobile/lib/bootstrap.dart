import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'di/injection.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printLog('[BlocObserver] onError ${bloc.runtimeType}', error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}

Future bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  GestureBinding.instance.resamplingEnabled = true;

  if (!kIsWeb) {
    unawaited(
      SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
        ],
      ),
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
      ),
    );
  } else {
    //! remove the leading hash (#) from URL
    //! Only for Web
    setPathUrlStrategy();
  }

  Bloc.observer = AppBlocObserver();

  FlutterError.onError = (details) {
    printLog(
      details.exceptionAsString(),
      details.exceptionAsString(),
      details.stack,
    );
  };

  await DependencyInjection.inject();

  await runZonedGuarded(
    () async => runApp(await builder()),
    (error, stack) {
      printLog(error.toString(), error.toString(), stack);
    },
  );
}
