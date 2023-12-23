import 'package:codmego_chat/helper/constants.dart';
import 'package:codmego_chat/views/widgets/chat_view_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static String id = 'chat view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Chat'),
            CircleAvatar(
              backgroundImage: AssetImage(kLogo),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: kColorLight,
        automaticallyImplyLeading: false,
      ),
      body: const ChatViewBody(),
    );
  }
}
