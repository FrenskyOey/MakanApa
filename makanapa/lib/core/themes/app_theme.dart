import 'package:flutter/material.dart';
import 'package:makanapa/core/themes/app_color.dart';
import 'package:makanapa/core/themes/app_text.dart';
import 'package:makanapa/core/themes/component/app_bar.dart';
import 'package:makanapa/core/themes/component/app_button.dart';
import 'package:makanapa/core/themes/component/app_input.dart';

class AppTheme {
  // --- LIGHT THEME (Base Theme) ---
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        tertiary: AppColor.tertiary,
        surface: AppColor.surface(),
        error: AppColor.error,
        onPrimary: Colors.white,
        onSurface: Colors.black,
      ),
      appBarTheme: appBarLight,
      textTheme: AppText.baseTextTheme,
      inputDecorationTheme: AppInput.inputLightTheme,
      // button styling
      elevatedButtonTheme: elevatedButton,
      filledButtonTheme: fillButton,
      outlinedButtonTheme: outlineButton,
      textButtonTheme: textButton,
      cardTheme: CardThemeData(
        color: const Color(0xFFF2F2F2),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  // --- DARK THEME ---
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColor.primary,
        secondary: AppColor.secondary,
        tertiary: AppColor.tertiary,
        surface: AppColor.surface(isDarkMode: true),
        error: AppColor.error,
        onPrimary: const Color.fromARGB(255, 241, 241, 241),
        onSurface: const Color.fromARGB(255, 241, 241, 241),
      ),
      appBarTheme: appBarDark,
      textTheme: AppText.darkTextTheme,
      inputDecorationTheme: AppInput.inputDarkTheme,
      // button styling
      elevatedButtonTheme: elevatedButton,
      filledButtonTheme: fillButton,
      outlinedButtonTheme: outlineButton,
      textButtonTheme: textButton,
      cardTheme: CardThemeData(
        color: const Color(0xFF2C2C2E),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.linux: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
