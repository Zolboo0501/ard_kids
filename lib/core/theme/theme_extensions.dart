import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  final Color hintColor;
  final Color textSubtlest;

  const CustomColors({required this.hintColor, required this.textSubtlest});

  @override
  CustomColors copyWith({Color? hintColor, Color? textSubtlest}) {
    return CustomColors(
      hintColor: hintColor ?? this.hintColor,
      textSubtlest: textSubtlest ?? this.textSubtlest,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      hintColor: Color.lerp(hintColor, other.hintColor, t)!,
      textSubtlest: Color.lerp(textSubtlest, other.textSubtlest, t)!,
    );
  }
}
