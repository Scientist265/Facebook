import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/core/screens/profile_screen.dart';
import 'package:facebook_clo/features/auth/providers/get_user_info_by_stream_by_id_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendTile extends ConsumerWidget {
  const FriendTile({super.key, required this.userId});
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
              InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName, arguments: userId);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(user.profilePicUrl),
                  )),
              gapW12,
              Text(
                user.fullName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => ErrorScreen(error: error.toString()),
      loading: () => const Loader(),
    );
  }
}
