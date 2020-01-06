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

class LoginLoading extends LoginState {
  final bool status;
  LoginLoading(this.status);
}

class ErrorState extends LoginState {
  final String message;

  ErrorState(this.message);
}
