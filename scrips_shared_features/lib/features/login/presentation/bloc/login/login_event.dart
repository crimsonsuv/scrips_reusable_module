part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetLoginResponseEvent extends LoginEvent {
  final BuildContext context;
  GetLoginResponseEvent(this.context);
}

class SetLoginDummyDataEvent extends LoginEvent {
  final BuildContext context;

  SetLoginDummyDataEvent(this.context);
}

class OnChangedValues extends LoginEvent {
  final String email;
  final String password;

  OnChangedValues(this.email, this.password);
}

class GetLoginError extends LoginEvent {
  final String message;

  GetLoginError(this.message);
}
