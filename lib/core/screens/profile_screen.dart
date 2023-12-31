import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/core/constants/extension.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/error_screen.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/core/widgets/round_button.dart';
import 'package:facebook_clo/features/auth/providers/get_user_info_by_stream_by_id_provider.dart';
import 'package:facebook_clo/features/friends/presentation/widgets/add_friend_button.dart';
import 'package:facebook_clo/features/post/presentation/widgets/icon_text_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    this.userId,
  });
  final String? userId;

  static const routeName = "/profile-screen";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUid = FirebaseAuth.instance.currentUser!.uid;
    final userInfo =
        ref.watch(getUserInfoAsStreamByIdProvider(userId ?? myUid));
    return userInfo.when(
      data: (userData) {
        return SafeArea(
            child: Scaffold(
          appBar: userId != myUid
              ? AppBar(
                  title: const Text("Profile Screen"),
                  centerTitle: true,
                )
              : null,
          backgroundColor: AppColors.whiteColor,
          body: Padding(
            padding: Constants.defaultPadding,
            child: Column(
              children: [
                gaph20,
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(userData.profilePicUrl),
                ),
                gaph12,
                Text(
                  userData.fullName,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                gaph20,
                userId == myUid
                    ? _buildAddToStoryButton()
                    : AddFriendButton(
                        user: userData,
                      ),
                gaph12,
                _buildProfileInfo(
                  email: userData.email,
                  gender: userData.gender,
                  birthDay: userData.birthday,
                )
              ],
            ),
          ),
        ));
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }

  _buildAddToStoryButton() =>
      RoundButton(onPressed: () {}, label: "Add To Story");

  _buildProfileInfo({
    required String email,
    required String gender,
    required DateTime birthDay,
  }) =>
      Column(
        children: [
          IconTextButton(
              label: gender,
              icon: gender == "male " ? Icons.male : Icons.female),
          gaph12,
          IconTextButton(
            label: birthDay.yMMMEd(),
            icon: Icons.cake,
          ),
          gaph12,
          IconTextButton(label: email, icon: Icons.mail)
        ],
      );
}
