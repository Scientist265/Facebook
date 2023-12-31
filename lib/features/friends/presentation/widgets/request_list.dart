import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/friends/presentation/widgets/request_tile.dart';
import 'package:facebook_clo/features/friends/providers/get_all_the_friend_request_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestList extends ConsumerStatefulWidget {
  const RequestList({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RequestListState();
}

class _RequestListState extends ConsumerState<RequestList> {
  @override
  Widget build(BuildContext context) {
    final requestList = ref.watch(getAllFriendRequest);

    return requestList.when(
      data: (requests) {
        return SliverList.builder(
          itemCount: requests.length,
          itemBuilder: (context, index) {
            final userId = requests.elementAt(index);
            return RequestTile(
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
