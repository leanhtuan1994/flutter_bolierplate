import 'package:core/constants/constants.dart';
import 'package:flutter/material.dart';

TextTheme buildTextTheme(TextTheme newBase) {
  return newBase
      .copyWith(
        displayLarge: newBase.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        displayMedium: newBase.displayLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),
        displaySmall: newBase.displaySmall?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        headlineMedium: newBase.headlineMedium?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
        headlineSmall: newBase.headlineSmall?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        labelLarge: newBase.labelLarge?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        labelMedium: newBase.labelMedium?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        labelSmall: newBase.labelSmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
        titleLarge: newBase.titleLarge?.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        titleMedium: newBase.titleMedium?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: newBase.titleSmall?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodyLarge: newBase.bodyLarge?.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: newBase.bodyMedium?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      )
      .apply(
        displayColor: AppColors.neutral100,
        bodyColor: AppColors.neutral100,
        fontFamily: AppConstants.defaultFont,
      );
}

const ColorScheme colorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: AppColors.primary,
  onPrimary: AppColors.neutral0,
  primaryContainer: AppColors.primary300,
  onPrimaryContainer: AppColors.primary600,
  background: AppColors.neutral0,
  onBackground: AppColors.neutral100,
  surface: AppColors.neutral0,
  onSurface: AppColors.neutral100,
  error: AppColors.error,
  onError: AppColors.neutral0,
  errorContainer: AppColors.error10,
  onErrorContainer: AppColors.error100,
  secondary: AppColors.primary400,
  onSecondary: AppColors.neutral0,
  secondaryContainer: AppColors.primary200,
  onSecondaryContainer: AppColors.primary700,
);

IconThemeData iconTheme(IconThemeData origin) {
  return origin.copyWith(
    color: AppColors.neutral80,
  );
}

ButtonThemeData get buttonTheme {
  return const ButtonThemeData(
    colorScheme: colorScheme,
    textTheme: ButtonTextTheme.normal,
    buttonColor: AppColors.neutral100,
  );
}

ThemeData get theme {
  final baseTheme = ThemeData.light(
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    dialogBackgroundColor: AppColors.neutral0,
    iconTheme: iconTheme(baseTheme.iconTheme),
    primaryIconTheme: iconTheme(baseTheme.primaryIconTheme),
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.neutral0,
    cardColor: AppColors.neutral0,
    errorColor: AppColors.error,
    hintColor: AppColors.neutral40,
    selectedRowColor: AppColors.primary,
    unselectedWidgetColor: AppColors.neutral40,
    buttonTheme: buttonTheme,
    scaffoldBackgroundColor: AppColors.neutral10,
    textTheme: buildTextTheme(baseTheme.textTheme),
    primaryTextTheme: buildTextTheme(baseTheme.textTheme),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
      backgroundColor: AppColors.neutral0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.neutral0,
        ),
        shadowColor: Colors.transparent,
        foregroundColor: AppColors.neutral0,
        backgroundColor: Colors.transparent,
        disabledForegroundColor: Colors.transparent,
        disabledBackgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        surfaceTintColor: Colors.transparent,
      ),
    ),
  );
}
