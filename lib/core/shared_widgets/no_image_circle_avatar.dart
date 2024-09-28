import 'package:flutter/material.dart';

class NoImageCircleAvatar extends StatelessWidget {
  const NoImageCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: Icon(
        Icons.person,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
