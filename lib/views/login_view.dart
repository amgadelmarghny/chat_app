// ignore_for_file: must_be_immutable

import 'package:codmego_chat/bloc/authBloc/auth_bloc.dart';
import 'package:codmego_chat/bloc/chatCubit/chat_cubit.dart';
import 'package:codmego_chat/helper/constants.dart';
import 'package:codmego_chat/views/chat_view.dart';
import 'package:codmego_chat/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'componant/snackbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSucces) {
          isLoading = false;
          debugPrint('***************************************');
          debugPrint(
              'User logged in successfully with email : ${BlocProvider.of<AuthBloc>(context).emailAddress}');
          BlocProvider.of<ChatCubit>(context).getMessages();

          Navigator.pushNamed(context, ChatView.id,
              arguments: LoginViewBody.emailAddress);
        } else if (state is LoginFailure) {
          debugPrint('***************************************');
          debugPrint(
              'User logged in successfully with email : ${BlocProvider.of<AuthBloc>(context).emailAddress}');
          isLoading = false;
          snacBar(context, state.errMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kColorBold,
          extendBodyBehindAppBar: false,
          //login view body
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
