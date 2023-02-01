import 'package:core/constants/constants.dart';
import 'package:core/mixins/after_layout_minxin.dart';
import 'package:core/widgets/loading/static_loading_screen.dart';
import 'package:flutter/material.dart';

import 'routes/routes.dart';

class AppInit extends StatefulWidget {
  const AppInit({super.key});

  @override
  State<AppInit> createState() => _AppInitState();
}

class _AppInitState extends State<AppInit> with AfterLayoutMixin {
  bool isLoading = true;
  bool isWaitingToNext = false;

  @override
  void afterFirstLayout(BuildContext context) {
    //! load init data config
    _loadInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaticLoadingScreen(
        onGoNext: _checkToShowNextScreen,
      ),
    );
  }

  void _loadInitData() {
    try {
      Future.delayed(Duration.zero, () {
        _endLoadingAndCheckToGo();
      });
    } catch (error) {
      printLog(error.toString());
      _endLoadingAndCheckToGo();
    }
  }

  void _endLoadingAndCheckToGo() {
    setState(() {
      isLoading = false;
    });

    if (isWaitingToNext) {
      _goToNextScreen();
    }
  }

  void _checkToShowNextScreen() {
    if (isLoading) {
      //! waiting to data loading
      setState(() {
        isWaitingToNext = true;
      });
    } else {
      //! loading done & go to next screen
      _goToNextScreen();
    }
  }

  void _goToNextScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.home);
  }
}
