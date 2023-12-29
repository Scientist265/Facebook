 import 'dart:io';

import 'package:facebook_clo/features/post/presentation/widgets/network_video_view.dart';
import 'package:facebook_clo/features/post/presentation/widgets/video_view.dart';
import 'package:flutter/material.dart';

class PostImageVideoView extends StatelessWidget {
  const PostImageVideoView({super.key, required this.fileType,  required this.fileUrl});
  final String fileType;
  final String fileUrl;

  @override
  Widget build(BuildContext context) {
    if (fileType == "image") {
      return Image.network(fileUrl);
    } else {
      return NetworkVideoView(videoUrl: fileUrl,);
    }
  }
}
