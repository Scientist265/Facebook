import 'dart:io';

import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/core/utils/utils.dart';
import 'package:facebook_clo/core/widgets/round_button.dart';
import 'package:facebook_clo/features/post/presentation/screen/image_video_view.dart';
import 'package:facebook_clo/features/post/presentation/widgets/profile_info.dart';
import 'package:facebook_clo/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePostScreen extends ConsumerStatefulWidget {
  const CreatePostScreen({super.key});

  static const routeName = "/create-Post";

  @override
  ConsumerState<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends ConsumerState<CreatePostScreen> {
  final _postController = TextEditingController();
  File? file;
  String fileType = "image";
  bool isLoading = false;

  @override
  void dispose() {
    _postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: makePost,
            style: TextButton.styleFrom(foregroundColor: AppColors.blueColor),
            child: const Text(
              "Post",
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ProfileInfo(),
              // PostText Field
              TextField(
                controller: _postController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "What's on your mind? ",
                  hintStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.darkGreyColor,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
              ),
              gaph20,
              file != null
                  ? ImageVideoView(
                      file: file!,
                      fileType: fileType,
                    )
                  : PickFileWidget(
                      pickImage: () async {
                        fileType = "image";
                        file = await pickImage();
                        setState(() {});
                      },
                      pickVideo: () async {
                        fileType = "video";
                        file = await pickVideo();
                        setState(() {});
                      },
                    ),
              gaph20,
              isLoading
                  ? const Loader()
                  : RoundButton(onPressed: makePost, label: "Post")
            ],
          ),
        ),
      ),
    );
  }

  // instance of makePosrt function
  Future<void> makePost() async {
    setState(() => isLoading = true);
    await ref
        .read(postProvider)
        .makePost(
            content: _postController.text, file: file!, postType: fileType)
        .then((value) {
      setState(() {
        isLoading = false;
      });
      showToastMessage(text: "Posted Successfuly");
      Navigator.of(context).pop();
    }).catchError((_) {
      setState(() {
        isLoading = false;
      });
    });
  }
}

class PickFileWidget extends StatelessWidget {
  const PickFileWidget(
      {super.key, required this.pickImage, required this.pickVideo});
  final VoidCallback pickImage, pickVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: pickImage,
          child: const Text("Pick Image"),
        ),
        const Divider(),
        TextButton(
          onPressed: pickVideo,
          child: const Text("Pick Video"),
        ),
      ],
    );
  }
}
