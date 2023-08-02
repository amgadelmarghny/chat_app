import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? emailAddress;
  String? password;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
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

        //RegisterEvent
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.emailAddress,
            password: event.password,
          );
          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure(
                errorMessage: 'The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure(
                errorMessage: 'The account already exists for that email.'));
          }
        } catch (e) {
          emit(RegisterFailure(errorMessage: e.toString()));
        }
      }
    });
  }
}
