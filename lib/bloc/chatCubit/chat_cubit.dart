import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codmego_chat/helper/constants.dart';
import 'package:codmego_chat/model/message_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  //messages is a Collection object
  CollectionReference messages =
      //kMessageCollection is a collection name of type String
      FirebaseFirestore.instance.collection(kMessageCollection);
  List<MessageModel> messageList = [];
//send message to firebase firestore
  void sendMessages({required String message, required String email}) {
    // Call the message's CollectionReference to add a new messade
    if (message.isNotEmpty) {
      messages.add({
        kMessage: message, // sent message
        kID: email, // emailAddress@website.com
        kCreatedAT: DateTime.now(),
      });
    }
  }

  void getMessages() {
    messages.orderBy(kCreatedAT, descending: true).snapshots().listen((event) {
      messageList.clear();
      for (var doc in event.docs) {
        messageList.add(MessageModel.fromJson(doc));
        emit(MessageSent(messageBlocList: messageList));
      }
    });
  }
}
