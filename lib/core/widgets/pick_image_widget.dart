import 'dart:io';

import 'package:facebook_clo/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.image});

  final File? image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
      child: Stack(
        children: [
          image != null
              ? CircleAvatar(
                  radius: 40,
                  backgroundImage: FileImage(image!),
                )
              : const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(Constants.maleProfilePic),
                ),
          const Positioned(
              bottom: 0,
              right: 0,
              child: FaIcon(
                FontAwesomeIcons.camera,
                color: Colors.black,
              ))
        ],
      ),
    );
  }
}
