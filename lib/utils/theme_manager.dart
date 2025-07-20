import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jamtm/utils/color_manager.dart';

class ThemeManager {
  static double horizontalPadding = 16;
  static DateFormat dateFormat = DateFormat('MMMM dd, yyyy');

  static final appTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.accent),
    appBarTheme: const AppBarTheme(
      surfaceTintColor: ColorManager.transparent,
      backgroundColor: ColorManager.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: ColorManager.white,
      surfaceTintColor: ColorManager.transparent,
    ),
    scaffoldBackgroundColor: ColorManager.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManager.white,
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: ColorManager.cardBackground,
      surfaceTintColor: ColorManager.transparent,
      shadowColor: ColorManager.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.selected)
              ? ColorManager.selectedSegment
              : null;
        }),
      ),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //    overlayColor: WidgetStateProperty.all(ColorManager.selectedSegment),
    //   ),
    // )
  );
}
