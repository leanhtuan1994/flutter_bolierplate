import 'package:core/constants/constants.dart';
import 'package:core/extensions/extensions.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key? key,
    required this.child,
    this.icon,
    this.height = AppConstants.kButtonHight,
    this.width,
    this.onPress,
    this.isLoading = false,
    this.color,
    this.disable = false,
    this.disableColor = AppColors.neutral10,
    this.tag = "buttonContainer",
    this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final Widget? icon;
  final double? height;
  final double? width;
  final VoidCallback? onPress;
  final bool isLoading;
  final Color? color;
  final bool disable;
  final Color? disableColor;
  final String tag;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color:
              disable ? disableColor : (color ?? context.colorScheme.primary),
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
        child: ElevatedButton(
          onPressed: disable || isLoading
              ? null
              : () {
                  EasyDebounce.debounce(
                    tag,
                    const Duration(milliseconds: 200),
                    () {
                      onPress?.call();
                    },
                  );
                },
          child: isLoading
              ? const SpinKitCircle(
                  color: Colors.white,
                  size: 30,
                )
              : icon != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icon!,
                        child,
                      ],
                    )
                  : child,
        ),
      ),
    );
  }
}
