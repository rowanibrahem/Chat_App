import 'package:bloc/bloc.dart';
import 'package:chatapp_mentor/features/home/data/model/message_model.dart';
import 'package:chatapp_mentor/features/home/data/repo/chat_repo.dart';
import 'package:chatapp_mentor/features/home/presentation/manager/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository _chatRepository;

  ChatCubit(this._chatRepository) : super(ChatInitial());

  void loadMessages(String chatId) {
    _chatRepository.getMessages(chatId).listen(
      (messages) {
        if (messages.isNotEmpty) {
          emit(LoadMessagesSuccess(messages));
        } else {
          emit(const LoadMessagesError('No messages found'));
        }
      },
    ).onError((error) {
      emit(LoadMessagesError(error.toString()));
    });
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
