import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/constants.dart';
import '../../extensions/extensions.dart';

class BaseBottomSheet<T> extends StatefulWidget {
  const BaseBottomSheet({
    Key? key,
    required this.title,
    this.titleWidget,
    this.child,
    this.titleColor,
    this.isDismissible = true,
    this.allowBottomInset = true,
  }) : super(key: key);

  final String title;
  final Widget? titleWidget;
  final Widget? child;
  final Color? titleColor;
  final bool isDismissible;
  final bool allowBottomInset;

  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    Widget? titleWidget,
    Color? backgroundColor = Colors.white,
    Widget? child,
    Color? titleColor = AppColors.neutral100,
    bool isDismissible = true,
    bool allowBottomInset = true,
  }) {
    return showModalBottomSheet(
      elevation: 1,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      context: context,
      builder: (context) {
        return BaseBottomSheet<T>(
          title: title,
          titleWidget: titleWidget,
          titleColor: titleColor,
          isDismissible: isDismissible,
          allowBottomInset: allowBottomInset,
          child: child,
        );
      },
    );
  }

  @override
  State<BaseBottomSheet> createState() => _BaseBottomSheetState();
}

class _BaseBottomSheetState extends State<BaseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: widget.allowBottomInset
              ? MediaQuery.of(context).viewInsets.bottom
              : 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: widget.titleWidget ??
                        Text(
                          widget.title,
                          maxLines: 1,
                          style: context.headline3?.copyWith(
                            color: widget.titleColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                  if (widget.isDismissible) ...[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(
                          Ic.bottomSheetClose,
                          color: widget.titleColor,
                          package: AppConstants.packageName,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            widget.child ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
