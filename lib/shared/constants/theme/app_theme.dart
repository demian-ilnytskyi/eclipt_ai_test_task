import 'package:exlipt_ai_test_task/shared/constants/theme/app_colors.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        AppBarTheme,
        BottomNavigationBarThemeData,
        Brightness,
        ButtonStyle,
        ButtonThemeData,
        Color,
        ColorScheme,
        Colors,
        IconButtonThemeData,
        MouseCursor,
        SystemMouseCursors,
        TextButtonThemeData,
        TextTheme,
        ThemeData,
        TooltipThemeData,
        WidgetState,
        WidgetStateProperty,
        WidgetStatePropertyAll;

final WidgetStateProperty<MouseCursor?> _buttonMouseCursor =
    WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return SystemMouseCursors.forbidden;
      }
      return SystemMouseCursors.click;
    });

ThemeData themeData = ThemeData(
  colorScheme: const ColorScheme(
    onError: AppColors.red,
    onSurface: AppColors.grey,
    primary: AppColors.white,
    secondary: AppColors.white,
    surface: AppColors.white,
    // background: AppColors.materialThemeWhite,
    error: AppColors.red,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
    brightness: Brightness.light,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(mouseCursor: _buttonMouseCursor),
  ),
  textTheme: const TextTheme()
    ..apply(
      bodyColor: AppColors.black,
      displayColor: AppColors.black,
      fontFamily: 'Montserrat',
    ),
  useMaterial3: true,
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.fromSwatch(backgroundColor: AppColors.white),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      overlayColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
      mouseCursor: _buttonMouseCursor,
    ),
  ),
);
