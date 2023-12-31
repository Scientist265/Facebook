import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/extension.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/auth/providers/get_user_info_by_id_provider.dart';
import 'package:facebook_clo/features/post/models/comments.dart';
import 'package:facebook_clo/features/post/presentation/widgets/round_file._tile.dart';
import 'package:facebook_clo/features/post/presentation/widgets/round_like_icon_widget.dart';
import 'package:facebook_clo/features/post/providers/post_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({super.key, required this.comment});

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          //comment header
          CommentHeader(
            comment: comment,
          ),

          //comment footer
          CommentFooter(comment: comment)
        ],
      ),
    );
  }
}

class CommentHeader extends ConsumerWidget {
  const CommentHeader({super.key, required this.comment});

  final Comment comment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(comment.authorId));
    return userInfo.when(
      data: (userData) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundProfileTile(
              url: userData.profilePicUrl,
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.realWhiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData.fullName,
                      style: const TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(comment.text),
                  ],
                ),
              ),
            )
          ],
        );
      },
      error: (error, stackTrace) => ErrorScreen(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}

class CommentFooter extends ConsumerStatefulWidget {
  const CommentFooter({super.key, required this.comment});
  final Comment comment;

  @override
  ConsumerState<CommentFooter> createState() => _CommentFooterState();
}

class _CommentFooterState extends ConsumerState<CommentFooter> {
  Future<void> getLikeDislikeComment() async {
    setState(() {});
    await ref.read(postProvider).likeDislikeComment(
        commentId: widget.comment.commentId, likes: widget.comment.likes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLiked =
        widget.comment.likes.contains(FirebaseAuth.instance.currentUser!.uid);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          widget.comment.createdAt.fromNow(),
        ),
        TextButton(
            onPressed: getLikeDislikeComment,
            child: Text(
              "like",
              style: TextStyle(
                color: isLiked ? AppColors.blueColor : AppColors.greyColor,
              ),
            )),
        gapW16,
        const RoundLikeIcon(),
        gapW8,
        Text(widget.comment.likes.length.toString())
      ],
    );
  }
}
