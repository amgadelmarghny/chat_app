part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class MessageSent extends ChatState {
  final List<MessageModel> messageBlocList;

    MessageSent({required this.messageBlocList});
}
