part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginResponseState extends LoginState {
  final LoginResponse response;

  LoginResponseState(this.response);
}

class LoginDummyDataState extends LoginState {
  final User user;
  LoginDummyDataState(this.user);
}

class LoginBeginLoading extends LoginState {}

class LoginEndLoading extends LoginState {}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);
}

class EnableLoginButtonState extends LoginState {
  final bool status;
  final User user;
  EnableLoginButtonState(this.user, this.status);
}
