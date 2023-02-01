import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/constants.dart';
import '../../mixins/after_layout_minxin.dart';

class StaticLoadingScreen extends StatefulWidget {
  const StaticLoadingScreen({
    super.key,
    required this.onGoNext,
    this.imgPath,
    this.duration = 1000,
  });

  final String? imgPath;
  final VoidCallback onGoNext;
  final int duration;

  @override
  State<StaticLoadingScreen> createState() => _StaticLoadingScreenState();
}

class _StaticLoadingScreenState extends State<StaticLoadingScreen>
    with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(
      Duration(milliseconds: widget.duration),
      () {
        widget.onGoNext();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          if (widget.imgPath?.trim().isNotEmpty ?? false) ...[
            Center(
              child: Image.asset(
                widget.imgPath!,
              ),
            )
          ],
          const Positioned(
            left: 0,
            right: 0,
            bottom: 48,
            child: SpinKitFoldingCube(
              size: 24,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
