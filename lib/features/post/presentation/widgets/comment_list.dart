import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/post/presentation/widgets/comment_tile.dart';
import 'package:facebook_clo/features/post/providers/get_all_comment_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsList extends ConsumerWidget {
  const CommentsList({super.key, required this.postId});
  final String postId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(getAllCommentsProvider(postId));
    return Expanded(
      child: comments.when(
        data: (commentsList) {
          return 
               ListView.builder(
                  itemCount: commentsList.length,
                  itemBuilder: ((context, index) {
                    final comment = commentsList.elementAt(index);
                    return CommentTile(comment: comment);
                  }));
        },
        error: (error, stackTrace) => ErrorScreen(error: error.toString()),
        loading: () {
          return const Center(child: Loader());
        },
      ),
    );
  }
}
