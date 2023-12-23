part of 'register_bloc.dart';

class RegisterEvent {
  final String emailAddress;
  final String password;

  RegisterEvent({required this.emailAddress, required this.password});
}
