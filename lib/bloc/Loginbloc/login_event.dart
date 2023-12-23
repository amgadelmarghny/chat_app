part of 'login_bloc.dart';

class LoginEvent {
  final String emailAddress;
  final String password;
  LoginEvent({
    required this.emailAddress,
    required this.password,
  });
}
