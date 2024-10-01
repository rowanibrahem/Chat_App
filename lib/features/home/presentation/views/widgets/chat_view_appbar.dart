import 'package:chatapp_mentor/features/home/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';

class ChatViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatViewAppbar({
    super.key,
    required this.widget, required String title,
  });

  final ConversationView widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0.0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Text(widget.name),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
