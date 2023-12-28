import "package:facebook_clo/features/post/presentation/make_post_widgets.dart";
import "package:flutter/material.dart";

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FeedMakePostWidget()
      ],
    );
  }
}
