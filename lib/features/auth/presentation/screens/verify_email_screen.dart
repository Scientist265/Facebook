import "package:facebook_clo/core/constants/constants.dart";
import "package:facebook_clo/core/constants/sizing.dart";
import "package:facebook_clo/core/widgets/round_button.dart";
import "package:flutter/material.dart";

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(onPressed: () {}, label: "Verify Email"),
            gaph20,
            RoundButton(onPressed: () {}, label: "Refresh"),
            gaph20,
            RoundButton(onPressed: () {}, label: "Chnage Email"),
          ],
        ),
      ),
    );
  }
}
