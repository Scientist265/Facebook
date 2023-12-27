import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/widgets/round_button.dart';
import 'package:facebook_clo/core/widgets/round_text_field.dart';
import 'package:facebook_clo/features/auth/presentation/screens/create_account_screen.dart';
import 'package:facebook_clo/features/auth/utils/utils.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constants.defaultPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/icons/fb_logo.png",
              width: 60,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundTextField(
                    controller: _emailController,
                    hintText: "Email",
                    textInputAction: TextInputAction.next,
                    validator: validateEmail,
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  gaph20,
                  RoundTextField(
                    controller: _emailController,
                    hintText: "Password",
                    textInputAction: TextInputAction.done,
                    validator: validatePassword,
                    isPassword: true,
                    keyBoardType: TextInputType.visiblePassword,
                  ),
                  gaph20,
                  RoundButton(
                    label: "Login",
                    onPressed: () {},
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: AppColors.blackColor),
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                RoundButton(
                  label: "Create new account",
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CreateAccountScreen.routeName,
                    );
                  },
                  color: Colors.transparent,
                ),
                Image.asset(
                  "assets/icons/meta.png",
                  height: 50,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
