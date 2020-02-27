import 'package:meta/meta.dart';

@immutable
abstract class CreatePasswordEvent {}

class EnabledButtonEvent extends CreatePasswordEvent {
  final String password;
  final String confirmPassword;
  EnabledButtonEvent({this.password, this.confirmPassword});
}

class CreatePassEvent extends CreatePasswordEvent {
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

class GetUserData extends CreatePasswordEvent {
  final String email;
  GetUserData({this.email});
}
