import 'package:chatapp_mentor/core/shared_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSuccess;

  const LoginButton({
    required this.emailController,
    required this.passwordController,
    required this.onSuccess,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Log In',
      func: () {
        if (!emailController.text.contains('@')) {
          displayToastMssg('Email address isn\'t valid', context);
        } else if (passwordController.text.isEmpty) {
          displayToastMssg('Password is mandatory', context);
        } else {
          onSuccess();
        }
      },
    );
  }
}
displayToastMssg(String msg, BuildContext context) {
    Fluttertoast.showToast(msg: msg);
  }