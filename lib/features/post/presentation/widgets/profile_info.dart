import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/screens/loader.dart';
import 'package:facebook_clo/features/auth/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileInfo extends ConsumerWidget {
  const ProfileInfo({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(authProvider).getUserInfo(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.hasData) {
          final user = snapshot.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user!.profilePicUrl),
              ),
              gapW12,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Public",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ), 
            ],
          );
        }
        return Text(snapshot.error.toString());
      }),
    );
  }
}
