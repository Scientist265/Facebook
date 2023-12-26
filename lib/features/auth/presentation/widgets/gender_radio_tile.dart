import 'package:flutter/material.dart';

class GenderRadioTile extends StatelessWidget {
  const GenderRadioTile({
    super.key,
    required this.title,
    required this.value,
    this.selectedValue,
    this.onChanged,
  });

  final String title;
  final String value;
  final String? selectedValue;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Radio.adaptive(
          value: value,
          groupValue: selectedValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
