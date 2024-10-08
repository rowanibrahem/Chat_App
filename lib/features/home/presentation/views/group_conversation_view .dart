import 'package:chatapp_mentor/features/auth/presentation/managers/auth_cubit/auth_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupConversationView extends StatefulWidget {
  const GroupConversationView({
    super.key,
    required this.groupId,
    required this.groupName,
  });

  final String groupId, groupName;

  @override
  State<GroupConversationView> createState() => _GroupConversationViewState();
}

class _GroupConversationViewState extends State<GroupConversationView> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadGroupMessages(widget.groupId);
  }

  String _formatTimestamp(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDay = DateTime(dateTime.year, dateTime.month, dateTime.day);

    if (messageDay == today) {
      return DateFormat('hh:mm a').format(dateTime);
    } else if (messageDay == today.subtract(const Duration(days: 1))) {
      return 'Yesterday, ${DateFormat('hh:mm a').format(dateTime)}';
    } else {
      return DateFormat('MMM d, hh:mm a').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Text(widget.groupName),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is LoadGroupMessagesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadGroupMessagesSuccess) {
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isSender = message.sender == currentEmail;
                      return Align(
                        alignment: isSender
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: isSender
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isSender
                                    ? Colors.green[100]
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(12),
                                  topRight: const Radius.circular(12),
                                  bottomLeft: isSender
                                      ? const Radius.circular(12)
                                      : const Radius.circular(0),
                                  bottomRight: isSender
                                      ? const Radius.circular(0)
                                      : const Radius.circular(12),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    message.sender, // عرض اسم المرسل
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[700]),
                                  ),
                                  Text(
                                    message.content,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: isSender
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text(
                                  _formatTimestamp(message.createdAt),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                } else if (state is LoadGroupMessagesError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                    ),
                  );
                } else if (state is SendGroupMessageLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SendGroupMessageError) {
                  return Center(
                    child: Text(
                        'Error occured while sending message: ${state.errorMessage}'),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
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
                context.read<ChatCubit>().sendGroupMessage(
                      widget.groupId,
                      _messageController.text,
                      currentEmail, // مرر البريد الإلكتروني للمرسل
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
