import 'package:flutter/material.dart';

class NoImageCircleAvatar extends StatelessWidget {
  const NoImageCircleAvatar({super.key, this.isGroup = false});
  final bool isGroup;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      child: Icon(
        isGroup == true ? Icons.groups : Icons.person,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
