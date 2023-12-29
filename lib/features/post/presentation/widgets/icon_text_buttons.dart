import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconTextButton extends StatelessWidget {
  const IconTextButton(
      {super.key,
       this.onPressed,
      required this.label,
      this.color,
      required this.icon});
  final VoidCallback? onPressed;
  final String label;
  final Color? color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          FaIcon(
            icon,
            size: 20,
            color: color,
          ),
          gapW8,
          Text(label),
        ],
      ),
    );
  }
}
