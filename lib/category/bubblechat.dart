import 'package:codmego_chat/model/message_model.dart';
import 'package:flutter/material.dart';
import '../helper/constants.dart';

class CustomBabbleChat extends StatelessWidget {
  const CustomBabbleChat({Key? key, required this.messageModel})
      : super(key: key);
  final MessageModel messageModel;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(left: 60, top: 10, right: 10, bottom: 10),
        padding:
            const EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 16),
        decoration: const BoxDecoration(
            color: kColorBold,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            )),
        child: Text(
          messageModel.message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}

class CustomFriendBabbleChat extends StatelessWidget {
  const CustomFriendBabbleChat({Key? key, required this.messageFriend})
      : super(key: key);
  final MessageModel messageFriend;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 10, top: 10, right: 60, bottom: 10),
        padding:
            const EdgeInsets.only(left: 16, top: 15, bottom: 15, right: 20),
        decoration: const BoxDecoration(
          color: kColorLight,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Text(
          messageFriend.message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
