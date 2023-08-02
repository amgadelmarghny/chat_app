part of 'auth_bloc.dart';


abstract class AuthState {}

class AuthInitial extends AuthState {}

//Lodging State
class LoginLoading extends AuthState {}

class LoginSucces extends AuthState {}

class LoginFailure extends AuthState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

//Register States
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String errorMessage;

  RegisterFailure({required this.errorMessage});
}
