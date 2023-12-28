import "package:facebook_clo/core/constants/constants.dart";
import "package:facebook_clo/core/constants/sizing.dart";
import "package:facebook_clo/core/screens/home_screen.dart";
import "package:facebook_clo/core/utils/utils.dart";
import "package:facebook_clo/core/widgets/round_button.dart";
import "package:facebook_clo/features/auth/providers/providers.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class VerifyEmailScreen extends ConsumerWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              onPressed: () async {
                await ref.read(authProvider).verifyEmail().then((value) {
                  if (value == null) {
                    showToastMessage(
                        text: "Email Verification sent to your email");
                  }
                });
              },
              label: "Verify Email",
            ),
            gaph20,
            RoundButton(
              onPressed: () async {
                await FirebaseAuth.instance.currentUser!.reload();

                final emailVerified =
                    FirebaseAuth.instance.currentUser!.emailVerified;

                if (emailVerified) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                } else {
                  showToastMessage(text: "Can't refresh");
                }

                // Navigator.of(context).pushNamed(HomeScreen.routeName);
              },
              label: "Refresh",
            ),
            gaph20,
            RoundButton(
              onPressed: () {
                ref.read(authProvider).signOut();
              },
              label: "Change Email",
            ),
          ],
        ),
      ),
    );
  }
}
