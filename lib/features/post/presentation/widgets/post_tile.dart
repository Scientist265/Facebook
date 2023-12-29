import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/widgets/post_info_tile.dart';
import 'package:facebook_clo/features/post/presentation/widgets/icon_text_buttons.dart';
import 'package:facebook_clo/features/post/presentation/widgets/post_image_video_view.dart';
import 'package:facebook_clo/features/post/presentation/widgets/round_like_icon_widget.dart';
import 'package:facebook_clo/features/post/providers/post_provider.dart';
import 'package:facebook_clo/features/post/repository/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostTile extends ConsumerWidget {
  const PostTile({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostInfoTile(
            createdAt: post.createdAt,
            userId: post.posterId,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Text(post.content),
          ),
          // Post Image or Video
          PostImageVideoView(
            fileUrl: post.fileUrl,
            fileType: post.postType,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Column(
              children: [
                PostState(
                  likes: post.likes,
                )
              ],
            ),
          ),
          //Post Buttons
          const Divider(),
          PostButtons(post: post)
        ],
      ),
    );
  }
}

class PostButtons extends ConsumerWidget {
  const PostButtons({required this.post, super.key});
  final Post post;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = post.likes.contains(FirebaseAuth.instance.currentUser!.uid);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          label: 'Like',
          icon: isLiked
              ? FontAwesomeIcons.solidThumbsUp
              : FontAwesomeIcons.thumbsUp,
          color: isLiked ? AppColors.blueColor : AppColors.blackColor,
          onPressed: () {
            ref
                .read(postProvider)
                .likeDislikePost(postId: post.postId, likes: post.likes);
          },
        ),
        const IconTextButton(
          label: 'comment',
          icon: FontAwesomeIcons.solidMessage,
        ),
        const IconTextButton(
          label: 'share',
          icon: FontAwesomeIcons.share,
        )
      ],
    );
  }
}

class PostState extends StatelessWidget {
  const PostState({super.key, required this.likes});

  final List<String> likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const RoundLikeIcon(),
        gapW8,
        Text(
          likes.length.toString(),
        ),
      ],
    );
  }
}
