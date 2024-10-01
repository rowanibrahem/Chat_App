import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chatapp_mentor/features/home/data/model/message_model.dart';
import 'package:chatapp_mentor/features/home/data/repo/chat_repo.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatInitial());

  void loadMessages(String chatId) {
    try {
      emit(LoadMessagesLoading());
      _chatRepository.getMessages(chatId).listen(
        (messages) {
          if (messages.isNotEmpty) {
            emit(LoadMessagesSuccess(messages));
          } else {
            log('No messages found, start a conversation');
            emit(const LoadMessagesError(
                'No messages found, start a conversation'));
          }
        },
      );
    } catch (error) {
      log('error while loading messages: $error');
      emit(LoadMessagesError(error.toString()));
    }
  }

  void sendMessage(String chatId, String content, String sender) {
    if (content.isNotEmpty) {
      emit(SendMessageLoading());
      final message = Message(
        sender: sender,
        content: content,
        createdAt: DateTime.now(),
      );
      _chatRepository.sendMessage(chatId, message).catchError(
            (error) => emit(SendMessageError(error.toString())),
          );
    }
  }
}
