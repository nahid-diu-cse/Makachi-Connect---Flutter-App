import 'package:flutter/material.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

class CustomDividerText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color lineColor;
  final double lineThickness;
  final double lineSpacing;

  const CustomDividerText({
    super.key,
    required this.text,
    this.textStyle,
    this.lineColor = Colors.grey,
    this.lineThickness = 1.0,
    this.lineSpacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: lineThickness,
            endIndent: lineSpacing,
          ),
        ),
        CustomText(
          text: text,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: Divider(
            color: lineColor,
            thickness: lineThickness,
            indent: lineSpacing,
          ),
        ),
      ],
    );
  }
}
