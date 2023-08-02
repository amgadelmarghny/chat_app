part of 'auth_bloc.dart';


abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String emailAddress;
  final String password;
  LoginEvent({required this.emailAddress,required this.password});
}

class RegisterEvent extends AuthEvent {
   final String emailAddress;
  final String password;

  RegisterEvent({required this.emailAddress,required this.password});
}
