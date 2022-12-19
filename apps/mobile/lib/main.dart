import 'dart:async';

import 'package:core/constants/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/di/injection.dart';
import 'package:mobile/presentation/app.dart';

void main() async {
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
  }

  await DependencyInjection.inject();

  runZonedGuarded(() {
    runApp(const App());
  }, (error, stack) {
    printLog(error);
  });
}
