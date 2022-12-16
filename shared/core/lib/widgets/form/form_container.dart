import 'package:core/extensions/extensions.dart';
import 'package:flutter/material.dart';

class FormContainer extends StatelessWidget {
  final Widget child;
  final Widget? icon;
  final bool hasFocus;
  final bool hasError;
  final double borderRadius;
  final String title;
  final bool isRequired;
  final String? errorText;
  final bool enabled;
  const FormContainer({
    Key? key,
    required this.child,
    this.icon,
    this.errorText,
    this.hasFocus = false,
    this.hasError = false,
    this.isRequired = true,
    this.borderRadius = 10,
    this.title = '',
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(hasError ? 1 : 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: (hasFocus
                  ? context.colorScheme.secondary
                  : hasError
                      ? context.colorScheme.error
                      : Colors.transparent),
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            color: enabled ? Colors.white : Colors.black.withAlpha(5),
          ),
          child: FormHandlerContainer(
            title: title,
            formField: child,
            isRequired: isRequired,
            hasError: hasError,
            errorText: errorText,
            borderRadius: borderRadius,
            icon: icon,
          ),
        ),
        const SizedBox(height: 4),
        if (hasError && (errorText ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              errorText ?? '',
              style: context.bodyText1?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: context.colorScheme.error,
              ),
            ),
          )
      ],
    );
  }
}

class FormHandlerContainer extends StatelessWidget {
  final String title;
  final bool isRequired;
  final Widget formField;
  final bool hasError;
  final String? errorText;
  final double borderRadius;
  final Widget? icon;
  const FormHandlerContainer({
    Key? key,
    required this.formField,
    this.icon,
    this.errorText,
    this.title = '',
    this.isRequired = true,
    this.hasError = false,
    this.borderRadius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Column(
              children: [
                if (title.isNotEmpty)
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: context.titleSmall?.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          isRequired == true ? ' *' : '',
                          style: context.titleSmall?.copyWith(
                            color: context.colorScheme.error,
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                if (title.isNotEmpty) const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [Container(child: formField)],
                  ),
                ),
                const SizedBox(height: 3),
              ],
            ),
          ),
        ),
        if (icon != null) icon!
      ],
    );
  }
}
