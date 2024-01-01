import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/story/presentation/screens/story_view_screen.dart';
import 'package:facebook_clo/features/story/presentation/widgets/add_story_tile.dart';
import 'package:facebook_clo/features/story/presentation/widgets/story_tile.dart';
import 'package:facebook_clo/features/story/providers/get_all_story_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoriesView extends ConsumerWidget {
  const StoriesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyData = ref.watch(getAllStoriesProvider);

    return storyData.when(
      data: (stories) {
        return SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: AppColors.realWhiteColor,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (conetxt, index) {
                  if (index == 0) {
                    return const AddStoryTile();
                  }
                  final story = stories.elementAt(index - 1);
                  return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            StoryViewScreen.routeName,
                            arguments: stories.toList());
                      },
                      child: StoryTile(imageUrl: story.imageUrl));
                }),
          ),
        );
      },
      error: (error, stackTrace) => SliverToBoxAdapter(
        child: ErrorScreen(error: error.toString()),
      ),
      loading: () => const SliverToBoxAdapter(
        child: Loader(),
      ),
    );
  }
}
