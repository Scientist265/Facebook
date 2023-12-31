import 'package:facebook_clo/core/screens/profile_screen.dart';
import 'package:facebook_clo/features/auth/providers/providers.dart';
import 'package:facebook_clo/features/post/presentation/screen/post_screen.dart';
import 'package:facebook_clo/features/post/presentation/screen/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Constants {
  // Default padding for screens
  static const defaultPadding = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );

  // demo profile urls
  static const String maleProfilePic =
      'https://jeremyveldman.com/wp-content/uploads/2019/08/Generic-Profile-Pic.jpg';

  static const String profilePicBlank =
      'https://t3.ftcdn.net/jpg/05/16/27/58/240_F_516275801_f3Fsp17x6HQK0xQgDQEELoTuERO4SsWV.jpg';

  static List<Tab> getHomeScreenTabs(int index) {
    return [
      Tab(
        icon: Icon(
          index == 0 ? Icons.home : Icons.home_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 1 ? Icons.group : Icons.group_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 2 ? Icons.smart_display : Icons.smart_display_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 3 ? Icons.account_circle : Icons.account_circle_outlined,
          color: Colors.blue,
        ),
      ),
      Tab(
        icon: Icon(
          index == 4 ? Icons.density_medium : Icons.density_medium_outlined,
          color: Colors.blue,
        ),
      ),
    ];
  }

  static List<Widget> screens = [
    const PostsScreen(),
    const Center(
      child: Text("Friends"),
    ),
    const VideoScreen(),
    const ProfileScreen(),
    Center(
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return TextButton(
            onPressed: () async {
              await ref.read(authProvider).signOut();
            },
            child: const Text("Logout"),
          );
        },
      ),
    ),
  ];

  Constants._();
}
