import 'package:flutter/material.dart';
import 'package:mini_task_manager/utils/color_manager.dart';

class ThemeManager {
  static double horizontalPadding = 20;

  static final appTheme = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: ColorManager.transparent,
      backgroundColor: ColorManager.white,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
    ),
  );
}
