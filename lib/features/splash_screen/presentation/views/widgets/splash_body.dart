import 'package:chatapp_mentor/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:chatapp_mentor/core/constants/asset_images.dart';
import 'package:chatapp_mentor/core/themes/styles.dart';


class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  SplashBodyState createState() => SplashBodyState();
}

class SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();

   Future.delayed(const Duration(seconds: 2), () {
      if (mounted) { 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginView(), 
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetImages.logo,
            ),
          Text(
            'Welcome Chat App',
            style: Styles.textStyle24,
          ),
        ],
      ),
    );
  }
}
