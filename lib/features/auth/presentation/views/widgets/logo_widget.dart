import 'package:chatapp_mentor/core/constants/asset_images.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        AssetImages.logo,
        width: 300,
        height: 250,
        ),
    );
  }
}