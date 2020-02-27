import 'package:meta/meta.dart';

@immutable
abstract class ResetPasswordNewPasswordEvent {}

class EnabledButtonEvent extends ResetPasswordNewPasswordEvent {
  final String password;
  final String confirmPassword;
  EnabledButtonEvent({this.password, this.confirmPassword});
}

class CreatePassEvent extends ResetPasswordNewPasswordEvent {
  final String password;
  final String confirmPassword;
  final String email;
  final String passwordResetToken;
  CreatePassEvent(
      {this.password,
      this.confirmPassword,
      this.email,
      this.passwordResetToken});
}

class OAuthLoginEvent extends ResetPasswordNewPasswordEvent {}
