import 'package:chatapp_mentor/features/home/data/chat_api_services/chat_api_services.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_cubit.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_state.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/chat_view_appbar.dart';
import 'package:chatapp_mentor/features/home/presentation/views/widgets/message_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ConversationView extends StatefulWidget {
  const ConversationView({
    super.key,
    required this.email,
    required this.name,
    required this.phone,
    required this.chatId,
  });

  final String email, name, phone, chatId;

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ChatCubit>().loadMessages(widget.chatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatViewAppbar(
        widget: widget,
        title: 'chat view',
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                if (state is LoadMessagesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadMessagesSuccess) {
                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final message = state.messages[index];
                      final isSender = message.sender == widget.email;
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
                              child: Text(
                                message.content,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: isSender
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text(
                                  formatTimestamp(message.createdAt),
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
                } else if (state is LoadMessagesError) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                    ),
                  );
                } else if (state is SendMessageLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SendMessageError) {
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
          MessageInput(
              messageController: _messageController,
              context: context,
              widget: widget),
        ],
      ),
    );
  }
}
