import 'package:flutter/material.dart';
import 'package:makachi_connect/res/app_colors.dart';
import 'package:makachi_connect/res/components/custom_text.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> items; // Dropdown items
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final bool enabled;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  // local variable to keep track of selected value
  String? _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: CustomText(
              text: widget.label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColors.pTextColor.withOpacity(.8),
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.pTextColor.withOpacity(0.3)),
          ),
          child: PopupMenuButton<String>(
            color: AppColors.whiteColor.withOpacity(.1),
            position: PopupMenuPosition.under,
            onSelected: widget.enabled
                ? (String value) {
                    setState(() {
                      _dropdownValue = value;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(value);
                    }
                  }
                : null,
            itemBuilder: (BuildContext context) {
              return widget.items.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: CustomText(text: value),
                );
              }).toList();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: _dropdownValue ?? widget.hintText,
                  style: TextStyle(
                    color: AppColors.pTextColor.withOpacity(0.7),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: AppColors.whiteColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
