import "package:facebook_clo/core/constants/sizing.dart";
import "package:facebook_clo/core/screens/error_screen.dart";
import "package:facebook_clo/core/screens/loader.dart";
import "package:facebook_clo/features/post/presentation/widgets/post_tile.dart";
import "package:facebook_clo/features/post/providers/get_all_videos_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class VideoScreen extends ConsumerWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getAllVideoProvider);

    return posts.when(
      data: (postsList) {
        return ListView.separated(
          itemCount: postsList.length,
          separatorBuilder: (context, index) => gaph8,
          itemBuilder: (context, index) {
            final post = postsList.elementAt(index);
            return PostTile(post: post);
          },
        );
      },
      error: (error, stacktTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }
}
