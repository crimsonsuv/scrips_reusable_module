part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;
  DoLoginEvent({this.email, this.password});
}

class SetLoginDummyDataEvent extends LoginEvent {
  final BuildContext context;
  SetLoginDummyDataEvent(this.context);
}

class OnChangedValuesEvent extends LoginEvent {
  final String email;
  final String password;
  OnChangedValuesEvent({this.email, this.password});
}

class GetLoginError extends LoginEvent {
  final String message;

  GetLoginError(this.message);
}
