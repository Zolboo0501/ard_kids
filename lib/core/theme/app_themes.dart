import 'package:ard_light/core/theme/colors/main_colors.dart';
import 'package:ard_light/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: LightColors.mainColorScheme,
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
    extensions: <ThemeExtension<dynamic>>[
      CustomColors(
        hintColor: LightColors.customColor["hintColor"]!,
        textSubtlest: LightColors.customColor["textSubtlest"]!,
      ),
    ],
  );
}
