import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:makachi_connect/res/app_paddings.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

import '../../app_colors.dart';
import '../../enum/enum.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final String? imagePath; // pass string path only
  final ImageType imageType;
  final VoidCallback onPressed;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color textColor;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final double? width;
  final double? height;
  final Color? iconColor;
  final double? iconSize;
  final MainAxisAlignment alignment;
  final IconData? trailingIcon; // New trailing icon property

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    this.imagePath,
    this.imageType = ImageType.asset, // default asset
    required this.onPressed,
    this.fontSize = 14,
    this.borderRadius = 12,
    this.padding,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.fontWeight = FontWeight.w500,
    this.width,
    this.height,
    this.iconColor,
    this.iconSize,
    this.alignment = MainAxisAlignment.center,
    this.trailingIcon, // Initialize the trailing icon
  });

  Widget _buildImage() {
    if (imagePath == null) return const SizedBox.shrink();

    switch (imageType) {
      case ImageType.asset:
        return Image.asset(
          imagePath!,
          width: fontSize.sp + 6,
          height: fontSize.sp + 6,
          fit: BoxFit.contain,
        );
      case ImageType.svg:
        return SvgPicture.asset(
          imagePath!,
          width: fontSize.sp + 6,
          height: fontSize.sp + 6,
          fit: BoxFit.contain,
        );
      case ImageType.network:
        return Image.network(
          imagePath!,
          width: fontSize.sp + 6,
          height: fontSize.sp + 6,
          fit: BoxFit.contain,
        );
      case ImageType.file:
        return Image.file(
          File(imagePath!),
          width: fontSize.sp + 6,
          height: fontSize.sp + 6,
          fit: BoxFit.contain,
        );
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectivePadding =
        padding ??
        EdgeInsets.symmetric(
          horizontal: AppPaddings.hPadding,
          vertical: AppPaddings.vPadding,
        );

    Widget button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        padding: effectivePadding,
      ),
      child: Row(
        mainAxisAlignment: alignment,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null)
            Padding(
              padding: EdgeInsets.only(
                right: (text != null || icon != null) ? 8.w : 0,
              ),
              child: _buildImage(),
            ),
          if (icon != null)
            Padding(
              padding: EdgeInsets.only(right: text != null ? 8.w : 0),
              child: Icon(
                icon,
                color: iconColor ?? textColor,
                size: iconSize ?? fontSize.sp,
              ),
            ),
          if (text != null)
            CustomText(
              text: text!,
              fontSize: fontSize,
              fontWeight: fontWeight,
              textColor: textColor,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          // Add trailing icon if present
          if (trailingIcon != null)
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Icon(
                trailingIcon,
                color: iconColor ?? textColor,
                size: iconSize ?? fontSize.sp,
              ),
            ),
        ],
      ),
    );

    return SizedBox(width: width?.w, height: height?.h, child: button);
  }
}
