import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/app_colors.dart';

class CustomBlurBgContainer extends StatelessWidget {
  final double? width;
  final Widget body;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final double blurSigma;

  const CustomBlurBgContainer({
    super.key,
    this.width,
    required this.body,
    this.padding,
    this.borderRadius = 10,
    this.blurSigma = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          // Positioned.fill ensures it covers the whole space of content
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
              child: Container(
                color: AppColors.bgColor.withOpacity(0.1),
              ),
            ),
          ),
          // Foreground content with padding
          Container(
            width: width,
            padding: padding,
            child: body,
          ),
        ],
      ),
    );
  }
}


