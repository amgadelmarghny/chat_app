import 'package:codmego_chat/bloc/chatCubit/chat_cubit.dart';
import 'package:codmego_chat/category/bubblechat.dart';
import 'package:codmego_chat/category/text_send_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/message_model.dart';

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({
    super.key,
  });

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> {
  final TextEditingController controller = TextEditingController();

  /*the controller that used in scrollDown
  * and we used it in _scrollDown that located at the bottom*/
  final ScrollController _controller = ScrollController();
  
  @override
  Widget build(BuildContext context) {
    final List<MessageModel> messageList =
        BlocProvider.of<ChatCubit>(context).messageList;
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is MessageSent) {
                return ListView.builder(
                    controller: _controller,
                    reverse: true,
                    itemCount: messageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return messageList[index].id == email
                          ? CustomBabbleChat(
                              messageModel: messageList[index],
                            )
                          : CustomFriendBabbleChat(
                              messageFriend: messageList[index],
                            );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        const TextMessegeField(),
      ],
    );
  }
}
