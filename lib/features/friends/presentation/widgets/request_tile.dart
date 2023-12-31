import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/core/screens/profile_screen.dart';
import 'package:facebook_clo/core/widgets/round_button.dart';
import 'package:facebook_clo/features/auth/providers/get_user_info_by_stream_by_id_provider.dart';
import 'package:facebook_clo/features/friends/providers/friend_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RequestTile extends ConsumerWidget {
  const RequestTile({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(getUserInfoAsStreamByIdProvider(userId));
    return userData.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(ProfileScreen.routeName,
                          arguments: user.uid);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.profilePicUrl),
                    )),
              ),
              gaph16,
              Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.fullName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      gaph16,
                      Row(
                        children: [
                          Expanded(
                              child: RoundButton(
                            onPressed: () {
                              ref
                                  .read(friendProvider)
                                  .acceptFriendRequest(userId: userId);
                            },
                            label: "Accept",
                            height: 30,
                          )),
                          gapW12,
                          Expanded(
                              child: RoundButton(
                            onPressed: () {
                              ref
                                  .read(friendProvider)
                                  .removeFriend(userId: userId);
                            },
                            label: "Reject",
                            height: 30,
                          )),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        );
      },
      error: (error, stackTrace) => ErrorScreen(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}
