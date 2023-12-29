import 'package:facebook_clo/features/post/presentation/widgets/comment_list.dart';
import 'package:facebook_clo/features/post/presentation/widgets/comment_text_field.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, required this.postId});
  final String postId;

  static const routeName = "/comment-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
      ),
      body: Column(
        children: [
          CommentsList(postId: postId),
          // comment TextField
          CommentTextField(postId: postId)
        ],
      ),
    );
  }
}
