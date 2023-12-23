import 'package:codmego_chat/bloc/chatCubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../helper/constants.dart';

class TextMessegeField extends StatefulWidget {
  const TextMessegeField({super.key});

  @override
  State<TextMessegeField> createState() => _TextMessegeFieldState();
}

class _TextMessegeFieldState extends State<TextMessegeField> {
  final TextEditingController controller = TextEditingController();

  /*the controller that used in scrollDown
  * and we used it in _scrollDown that located at the bottom*/
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;

    return Padding(
        padding: const EdgeInsets.all(9),
        child: TextField(
          // the controller that clear text after
          // sending message in TextField
          controller: controller,
          onSubmitted: (data) {
            BlocProvider.of<ChatCubit>(context)
                .sendMessages(message: data, email: email);
            // here is text clearer controller
            // that we access in TextField
            controller.clear();
            // here is scroll down programmatically scrolling down
            // that we access the _controller in ListView
            _scrollDown();
          },
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.send_outlined,
              color: kColorLight,
              size: 40,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kColorLight),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }

  void _scrollDown() {
    if (_controller.hasClients) {
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
