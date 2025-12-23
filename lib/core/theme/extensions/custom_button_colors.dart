import 'package:flutter/material.dart';

@immutable
class CustomButtonColors extends ThemeExtension<CustomButtonColors> {
  // Button Color 1
  final Color button1Color;
  final Color onButton1Color;

  // Button Color 2
  final Color button2Color;
  final Color onButton2Color;

  const CustomButtonColors({
    required this.button1Color,
    required this.onButton1Color,
    required this.button2Color,
    required this.onButton2Color,
  });

  @override
  CustomButtonColors copyWith({
    Color? button1Color,
    Color? onButton1Color,
    Color? button2Color,
    Color? onButton2Color,
  }) {
    return CustomButtonColors(
      button1Color: button1Color ?? this.button1Color,
      onButton1Color: onButton1Color ?? this.onButton1Color,
      button2Color: button2Color ?? this.button2Color,
      onButton2Color: onButton2Color ?? this.onButton2Color,
    );
  }

  @override
  CustomButtonColors lerp(ThemeExtension<CustomButtonColors>? other, double t) {
    if (other is! CustomButtonColors) return this;
    return CustomButtonColors(
      button1Color: Color.lerp(button1Color, other.button1Color, t)!,
      onButton1Color: Color.lerp(onButton1Color, other.onButton1Color, t)!,
      button2Color: Color.lerp(button2Color, other.button2Color, t)!,
      onButton2Color: Color.lerp(onButton2Color, other.onButton2Color, t)!,
    );
  }
}
