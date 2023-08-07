

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String? emailAddress;
  String? password;
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async{
      emit(LoginLoading());

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.emailAddress, password: event.password);
          emit(LoginSucces());
          debugPrint('User Logged in');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(errMessage: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(
                errMessage: 'Wrong password provided for that user.'));
          }
        }
    });
  }
}
