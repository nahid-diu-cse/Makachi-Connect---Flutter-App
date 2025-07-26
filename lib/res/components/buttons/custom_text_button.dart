import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

import '../../app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final IconData? prefixIcon; // Prefix icon (before text)
  final IconData? postfixIcon; // Postfix icon (after text)
  final String? imageIconPath; // Path to image icon
  final VoidCallback onPressed;
  final double fontSize;
  final Color textColor;
  final Color iconColor;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double? width;
  final double? height;
  final MainAxisAlignment alignment;
  final Color? backgroundColor;
  final double borderRadius;
  final Color? borderColor;
  final double borderWidth;
  final TextStyle? textStyle; // Add this line to accept text styling

  const CustomTextButton({
    super.key,
    required this.text,
    this.prefixIcon,
    this.postfixIcon,
    this.imageIconPath,
    required this.onPressed,
    this.fontSize = 14.0,
    this.textColor = AppColors.tTextColor,
    this.iconColor = Colors.transparent,
    this.iconSize = 20.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.width,
    this.height,
    this.alignment = MainAxisAlignment.center,
    this.backgroundColor,
    this.borderRadius = 12.0,
    this.borderColor,
    this.borderWidth = 1,
    this.textStyle, // Initialize the textStyle property
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          border: borderColor != null
              ? Border.all(color: borderColor!, width: borderWidth)
              : null,
          boxShadow: [
            if (backgroundColor != null)
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 2.0,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            foregroundColor: Colors.transparent,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: alignment,

            children: [
              if (prefixIcon != null)
                Icon(prefixIcon, color: iconColor, size: iconSize.sp),
              if (imageIconPath != null)
                Image.asset(
                  imageIconPath!,
                  width: iconSize.sp,
                  height: iconSize.sp,
                ),
              if (text!.isNotEmpty && (prefixIcon != null || imageIconPath != null))
                SizedBox(width: 8.w),
              if (text!.isNotEmpty)
                CustomText(
                  text: text!,
                  style: textStyle ??
                      TextStyle(fontSize: fontSize.sp, color: textColor), // Apply textStyle if provided
                ),
              if (text!.isNotEmpty && postfixIcon != null)
                SizedBox(width: 8.w),
              if (postfixIcon != null)
                Icon(postfixIcon, color: iconColor, size: iconSize.sp),
            ],
          ),
        ),
      ),
    );
  }
}
