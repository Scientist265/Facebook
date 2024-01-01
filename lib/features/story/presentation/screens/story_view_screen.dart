import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/widgets/post_info_tile.dart';
import 'package:facebook_clo/features/story/models/story_model.dart';
import 'package:facebook_clo/features/story/providers/get_story_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key, required this.stories});

  final List<Story> stories;
  static const routeName = "/story-vew";

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final controller = StoryController();

  final List<StoryItem> storyItems = [];

  @override
  void initState() {
    for (final story in widget.stories) {
      final storyViews = StoryItem(
        StoryDetailScreen(
          story: story,
        ),
        duration: const Duration(seconds: 5),
      );
      storyItems.add(storyViews);
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StoryView(
      storyItems: storyItems,
      controller: controller,
      indicatorColor: Colors.black,
      onComplete: Navigator.of(context).pop,
    );
  }
}

class StoryDetailScreen extends ConsumerStatefulWidget {
  const StoryDetailScreen({
    super.key,
    required this.story,
  });

  final Story story;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoryDetailScreenState();
}

class _StoryDetailScreenState extends ConsumerState<StoryDetailScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(storyProvider).viewStory(storyId: widget.story.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                widget.story.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: PostInfoTile(
              createdAt: widget.story.createdAt,
              userId: widget.story.authorId,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 50,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.eye,
                    color: AppColors.realWhiteColor,
                  ),
                  gapW8,
                  Text(
                    widget.story.views.length.toString(),
                    style: const TextStyle(color: AppColors.realWhiteColor),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
