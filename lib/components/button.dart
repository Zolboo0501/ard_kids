import 'package:ard_light/components/text_view.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? fontsize;
  final FontWeight? fontweight;
  final Color color;
  final Color? titleColor;
  final double? height;
  final Widget? child;
  final Widget? icon;
  const Button({
    super.key,
    required this.onTap,
    required this.text,
    this.fontsize = 16,
    this.fontweight,
    this.color = const Color(0xFF141414),
    this.titleColor,
    this.height = 48,
    this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0, // Removes the shadow
          backgroundColor: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) icon!,
            if (icon != null) SizedBox(width: 8),
            TextView(
              text: text,
              fontSize: fontsize ?? 16,
              fontWeight: fontweight ?? FontWeight.w400,
              color: titleColor ?? Color(0xB2FFFFFF),
            ),
          ],
        ),
      ),
    );
  }
}
