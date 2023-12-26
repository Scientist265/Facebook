import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/features/auth/presentation/widgets/gender_radio_tile.dart';
import 'package:flutter/material.dart';

class GenderPicker extends StatelessWidget {
  const GenderPicker({super.key, this.gender, required this.onChanged});
  final String? gender;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: const BoxDecoration(
        color: AppColors.darkWhiteColor,
      ),
      child: Column(
        children: [
          GenderRadioTile(
            title: "Male",
            value: "male",
            selectedValue: gender,
            onChanged: onChanged,
          ),
          GenderRadioTile(
            
            title: "Female",
            value: "female",
            selectedValue: gender,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
