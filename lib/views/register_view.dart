import 'package:codmego_chat/bloc/authBloc/auth_bloc.dart';
import 'package:codmego_chat/bloc/chatCubit/chat_cubit.dart';
import 'package:codmego_chat/helper/constants.dart';
import 'package:codmego_chat/views/chat_view.dart';
import 'package:codmego_chat/views/componant/snackbar.dart';
import 'package:codmego_chat/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const String id = 'RegisterView';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          debugPrint('**********************************');
          debugPrint(
              "User registered successfully with email : ${RegisterViewBody.emailAddress}");
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatView.id,
              arguments: RegisterViewBody.emailAddress);
        } else if (state is RegisterFailure) {
          isLoading = false;
          snacBar(context, state.errorMessage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kColorBold,
          extendBodyBehindAppBar: false,
          //Register view body
          body: RegisterViewBody(),
        ),
      ),
    );
  }
}
