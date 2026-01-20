import 'package:flutter/material.dart';

class LightColors {
  static const ColorScheme mainColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xE5000000),
    onPrimary: Color(0xFFF5F5F5),

    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xE5000000),
    error: Color(0xFFFF6B6B),
    onError: Color(0xFFC9372C),
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFFE0E0E0),
  );

  static const customColor = {
    "hintColor": Color(0xFFBDBDBD),
    "textSubtlest": Color(0x80000000),
  };
}

class DarkColors {
  static const ColorScheme mainColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF1E1E1E),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF2C2C2C),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFFF6B6B),
    onError: Color(0xFFC9372C),
    surface: Color(0xFF1E1E1E),
    onSurface: Color(0xFFFFFFFF),
  );

  static const customColor = {
    "hintColor": Color(0xFFBDBDBD),
    "textSubtlest": Color(0x80000000),
  };
}
