import 'package:chatapp_mentor/features/home/data/model/message_model.dart';
import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class LoadMessagesLoading extends ChatState {}

class LoadMessagesSuccess extends ChatState {
  final List<Message> messages;

  const LoadMessagesSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class LoadMessagesError extends ChatState {
  final String errorMessage;

  const LoadMessagesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SendMessageLoading extends ChatState {}

class SendMessageError extends ChatState {
  final String errorMessage;

  const SendMessageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoadGroupMessagesLoading extends ChatState {}

class LoadGroupMessagesSuccess extends ChatState {
  final List<Message> messages;

  const LoadGroupMessagesSuccess(this.messages);

  @override
  List<Object> get props => [messages];
}

class LoadGroupMessagesError extends ChatState {
  final String errorMessage;

  const LoadGroupMessagesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SendGroupMessageLoading extends ChatState {}

class SendGroupMessageError extends ChatState {
  final String errorMessage;

  const SendGroupMessageError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SendGroupMessageSuccess extends ChatState {}
