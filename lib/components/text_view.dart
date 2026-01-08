import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final bool isUnderline;
  const TextView({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.roboto(
        textStyle: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? Theme.of(context).colorScheme.primary,
          decoration: isUnderline
              ? TextDecoration.underline
              : TextDecoration.none,
          decorationColor: isUnderline
              ? color ?? Theme.of(context).colorScheme.primary
              : null,
        ),
      ),
    );
  }
}
