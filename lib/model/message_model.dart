import 'package:codmego_chat/helper/constants.dart';

class MessageModel {
  final String message;
  final String id;
  const MessageModel({required this.message,required this.id});


  factory MessageModel.fromJson(dynamic json){
    return  MessageModel(message: json[kMessage] ,id: json[kID]); // Replace with your own message from API response or local
  }
}
