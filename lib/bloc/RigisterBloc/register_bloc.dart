import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  String? emailAddress;
  String? password;
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      //RegisterEvent

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
    });
  }
}
