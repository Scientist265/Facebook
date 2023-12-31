import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/friends/presentation/widgets/friend_tile.dart';
import 'package:facebook_clo/features/friends/providers/get_all_friends_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendList extends ConsumerStatefulWidget {
  const FriendList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FriendListState();
}

class _FriendListState extends ConsumerState<FriendList> {
  @override
  Widget build(BuildContext context) {
    final friendList = ref.watch(getAllFriendsProvider);

    return friendList.when(
      data: (friends) {
        return SliverList.builder(
          itemCount: friends.length,
          itemBuilder: (context, index) {
            final userId = friends.elementAt(index);
            return FriendTile(
              userId: userId,
            );
          },
        );
      },
      error: (error, stackTrace) =>
          SliverToBoxAdapter(child: ErrorScreen(error: error.toString())),
      loading: () => const SliverToBoxAdapter(child: Loader()),
    );
  }
}
