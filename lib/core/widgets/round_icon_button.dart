import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({super.key, required this.icon, this.onPresssed});
  final IconData icon;
  final VoidCallback? onPresssed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresssed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: CircleAvatar(
          backgroundColor: AppColors.greyColor,
          radius: 20,
          child: FaIcon(
            icon,
            color: AppColors.blackColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
