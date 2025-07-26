import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textColor;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration textDecoration;
  final EdgeInsetsGeometry? padding;
  final double letterSpacing;
  final double wordSpacing;
  final TextStyle? style; // user custom style

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontWeight = FontWeight.normal,
    this.textColor = AppColors.pTextColor,
    this.textAlign = TextAlign.left,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textDecoration = TextDecoration.none,
    this.padding,
    this.letterSpacing = 0.0,
    this.wordSpacing = 0.0,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle baseStyle = GoogleFonts.poppins(
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      color: textColor,
      decoration: textDecoration,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );

    final TextStyle effectiveStyle = (style != null)
        ? style!.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: style?.fontSize,
          )
        : baseStyle;

    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text,
        style: effectiveStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: maxLines == null ? null : overflow,
      ),
    );
  }
}
