import 'package:flutter/material.dart';

class InkwellWidget extends StatelessWidget {
  const InkwellWidget({
    Key? key,
    this.child,
    this.onTap,
    this.radius,
    this.isDisable = false,
  }) : super(key: key);

  final Widget? child;
  final VoidCallback? onTap;
  final double? radius;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AbsorbPointer(
        absorbing: isDisable,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 0),
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
