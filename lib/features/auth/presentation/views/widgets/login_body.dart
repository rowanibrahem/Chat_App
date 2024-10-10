import 'package:chatapp_mentor/features/auth/presentation/views/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
      LogoWidget(),
    ],);
  }
}