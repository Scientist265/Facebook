import 'package:flutter/material.dart';

class RoundTextField extends StatelessWidget {
  const RoundTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.isPassword = false,
      this.keyBoardType = TextInputType.text,
      required this.textInputAction,
      this.validator});

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType keyBoardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          
        ),
        
      ),
      obscureText: isPassword,
      keyboardType: keyBoardType,
      textInputAction: textInputAction,
      validator: validator,
    );
  }
}
