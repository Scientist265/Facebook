import 'dart:io';

import 'package:facebook_clo/core/constants/app_colors.dart';
import 'package:facebook_clo/core/constants/constants.dart';
import 'package:facebook_clo/core/constants/sizing.dart';
import 'package:facebook_clo/core/utils/utils.dart';
import 'package:facebook_clo/core/widgets/pick_image_widget.dart';
import 'package:facebook_clo/core/widgets/round_button.dart';
import 'package:facebook_clo/core/widgets/round_text_field.dart';
import 'package:facebook_clo/features/auth/presentation/widgets/birthday_picker.dart';
import 'package:facebook_clo/features/auth/presentation/widgets/gender_picker.dart';
import 'package:facebook_clo/features/auth/utils/utils.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  File? image;
  String gender = "male";
  DateTime? birthday;
  // controllers
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.realWhiteColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.defaultPadding,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    image = await pickImage();
                    setState(() {});
                  },
                  child: PickImageWidget(
                    image: image,
                  ),
                ),
                gaph20,
                Row(
                  children: [
                    Expanded(
                      child: RoundTextField(
                        controller: _fNameController,
                        hintText: "First Name",
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                    gapW8,
                    Expanded(
                      child: RoundTextField(
                        controller: _lNameController,
                        hintText: "Last Name",
                        textInputAction: TextInputAction.next,
                        validator: validateName,
                      ),
                    ),
                  ],
                ),
                gaph20,
                BirthdayPickerWidget(
                  dateTime: birthday ?? DateTime.now(),
                  onPressed: () async {
                    birthday = await pickSimpleDate(
                      context: context,
                      date: birthday,
                    );
                    setState(() {});
                  },
                ),
                gaph20,
                GenderPicker(
                    gender: gender,
                    onChanged: (value) {
                      gender = value ?? "male";
                      setState(() {});
                    }),
                gaph20,
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
                  label: "Next",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
