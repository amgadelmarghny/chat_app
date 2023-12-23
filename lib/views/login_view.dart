// ignore_for_file: must_be_immutable

import 'package:codmego_chat/bloc/chatCubit/chat_cubit.dart';
import 'package:codmego_chat/helper/constants.dart';
import 'package:codmego_chat/views/chat_view.dart';
import 'package:codmego_chat/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../bloc/Loginbloc/login_bloc.dart';
import 'componant/snackbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucces) {
          isLoading = false;

          BlocProvider.of<ChatCubit>(context).getMessages();
          debugPrint("######################");
          debugPrint('email : ${BlocProvider.of<LoginBloc>(context).emailAddress}');
          Navigator.pushNamed(context, ChatView.id,
              arguments: BlocProvider.of<LoginBloc>(context).emailAddress);
        } else if (state is LoginFailure) {
          isLoading = false;
          snacBar(context, state.errMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: const Scaffold(
          backgroundColor: kColorBold,
          extendBodyBehindAppBar: false,
          //login view body
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
