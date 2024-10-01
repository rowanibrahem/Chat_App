import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/views/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageInput extends StatelessWidget {
  const MessageInput({
    super.key,
    required TextEditingController messageController,
    required this.context,
    required this.widget,
  }) : _messageController = messageController;

  final TextEditingController _messageController;
  final BuildContext context;
  final ConversationView widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.green,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                context.read<ChatCubit>().sendMessage(
                      widget.chatId,
                      _messageController.text,
                      widget.email,
                    );
                _messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
