part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class DoLoginEvent extends LoginEvent {
  final User user;
  final BuildContext context;

  DoLoginEvent(this.context, this.user);
}

class SetLoginDummyDataEvent extends LoginEvent {
  final BuildContext context;

  SetLoginDummyDataEvent(this.context);
}

class OnChangedValuesEvent extends LoginEvent {
  final User user;

  OnChangedValuesEvent(this.user);
}

class GetLoginError extends LoginEvent {
  final String message;

  GetLoginError(this.message);
}

class CallApiForForgotPasswordEvent extends LoginEvent {
  final ResetPasswordModel resetPasswordModel;

  CallApiForForgotPasswordEvent(this.resetPasswordModel);
}

class CallApiSetPasswordEvent extends LoginEvent {
  final SetPasswordModel setPasswordModel;

  CallApiSetPasswordEvent(this.setPasswordModel);
}
