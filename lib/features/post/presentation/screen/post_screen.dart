import "package:facebook_clo/core/constants/sizing.dart";
import "package:facebook_clo/core/screens/error_screen.dart";
import "package:facebook_clo/core/screens/loader.dart";
import "package:facebook_clo/features/post/presentation/make_post_widgets.dart";
import "package:facebook_clo/features/post/presentation/widgets/post_tile.dart";
import "package:facebook_clo/features/post/providers/get_all_post_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        FeedMakePostWidget(),
        PostsList(),
        // Post List Widget
      ],
    );
  }
}

class PostsList extends ConsumerWidget {
  const PostsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getAllPostProvider);

    return posts.when(
      data: (postsList) {
        return SliverList.separated(
          itemCount: postsList.length,
          separatorBuilder: (context, index) => gaph8,
          itemBuilder: (context, index) {
            final post = postsList.elementAt(index);
            return PostTile(post: post);
          },
        );
      },
      error: (error, stacktTrace) {
        return SliverToBoxAdapter(
          child: ErrorScreen(error: error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Loader(),
        );
      },
    );
  }
}
