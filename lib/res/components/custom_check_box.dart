import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final String? label;
  final Color activeColor;
  final Color borderColor;
  final double size;
  final double borderRadius;
  final IconData checkIcon;
  final double iconSize;
  final TextStyle? labelStyle;
  final MainAxisAlignment alignment;

  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.label,
    this.activeColor = Colors.transparent,
    this.borderColor = Colors.grey,
    this.size = 24.0,
    this.borderRadius = 6.0,
    this.checkIcon = Icons.check,
    this.iconSize = 16.0,
    this.labelStyle,
    this.alignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: alignment,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: isChecked ? activeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Center(
              child: isChecked
                  ? Icon(checkIcon, size: iconSize, color: Colors.white)
                  : null,
            ),
          ),
          if (label != null) ...[
            SizedBox(width: 8),
            Text(label!, style: labelStyle ?? const TextStyle(fontSize: 16)),
          ],
        ],
      ),
    );
  }
}
