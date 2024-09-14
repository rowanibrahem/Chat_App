import 'package:chatapp_mentor/features/auth/presentation/views/widgets/signup_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: SignupBody(),
      ),
    );
  }
}
