import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/features/post/providers/post_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;

class CommentTextField extends ConsumerStatefulWidget {
  const CommentTextField({super.key, required this.postId});
  final String postId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommentTextFieldState();
}

class _CommentTextFieldState extends ConsumerState<CommentTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> makeComment() async {
    final text = controller.text;
    controller.clear();
    await ref.read(postProvider).makeComment(
          text: text,
          postId: widget.postId,
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8),
      child: TextField(
        controller: controller,
        maxLength: 500,
        minLines: 1,
        maxLines: 10,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: "Write your comment",
            hintStyle: const TextStyle(fontSize: 16),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blueColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blueColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blueColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                )),
            enabled: true,
            suffixIcon: Transform.rotate(
              angle: -20 * math.pi / 180,
              child: IconButton(
                onPressed: makeComment,
                icon: const Icon(Icons.send),
              ),
            )),
      ),
    );
  }
}
