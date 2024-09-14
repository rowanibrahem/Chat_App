import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'WhatsApp',
                ),
             Icon(Icons.search),
             Icon(Icons.do_not_step),
            ],
          ),
        ],
      ),
      );
  }
}