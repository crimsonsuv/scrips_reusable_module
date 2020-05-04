part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginResponseState extends LoginState {
  final LoginUserData response;

  LoginResponseState(this.response);
}

class LoginBeginLoading extends LoginState {}

class LoginEndLoading extends LoginState {}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);
}

class EnableLoginButtonState extends LoginState {
  final bool status;
  final String email;
  final String password;
  EnableLoginButtonState({this.email, this.password, this.status});
}
