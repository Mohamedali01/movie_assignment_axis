import 'package:flutter/material.dart';

import 'colors/app_colors.dart';
import 'colors/hex_colors.dart';
import 'font_styles/font_styles.dart';

class AppTheme {

  static generate() {
    return ThemeData(
      useMaterial3: false,
      scaffoldBackgroundColor: AppColors.scaffoldBackground,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBackground,
        iconTheme: IconThemeData(color: AppColors.primary, size: 30),
        titleTextStyle: FontStyles.h3.copyWith(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        space: 1,
        color: HexColor("#CFCFCF"),
      ),
      textTheme: TextTheme(
        bodyLarge: FontStyles.b1.copyWith(
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: FontStyles.b2.copyWith(
          fontWeight: FontWeight.normal,
        ),
        labelLarge: FontStyles.buttons,
        titleLarge: FontStyles.h1,
        headlineSmall: FontStyles.h2,
      ).apply(
        bodyColor: Colors.black,
        displayColor: Colors.black,
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: AppColors.primary,
      ).copyWith(surface: Colors.white),
    );
  }
}
