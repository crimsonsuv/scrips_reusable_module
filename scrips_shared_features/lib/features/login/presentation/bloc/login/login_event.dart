part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetLoginResponseEvent extends LoginEvent {
  final BuildContext context;
  final String email;
  final String password;

  GetLoginResponseEvent(this.context, this.email, this.password);
}

class SetLoginDummyDataEvent extends LoginEvent {
  final BuildContext context;

  SetLoginDummyDataEvent(this.context);
}

class GetLoginError extends LoginEvent {
  final String message;

  GetLoginError(this.message);
}
