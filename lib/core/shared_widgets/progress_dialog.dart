import 'package:chatapp_mentor/core/themes/colors.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({required this.progressText , super.key});
  final String progressText;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorApp.primaryColor,
      child: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
              const SizedBox(
                width: 26,
              ),
              Text(
                progressText,
                style: const TextStyle(color: Colors.black , fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
