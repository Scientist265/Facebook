import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/extension.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/core/screens/profile_screen.dart';
import 'package:facebook_clo/features/auth/providers/get_user_info_by_id_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostInfoTile extends ConsumerWidget {
  const PostInfoTile(
      {super.key, required this.createdAt, required this.userId});
  final DateTime createdAt;
  final String userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(userId));
    return userInfo.when(
      data: (user) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // This is to navigate to other People Profile but not mine from HomeScreen
                  if (user.uid != FirebaseAuth.instance.currentUser!.uid) {
                    Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName, arguments: userId);
                  }
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePicUrl),
                ),
              ),
              gapW12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    createdAt.fromNow(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () => const Loader(),
    );
  }
}
