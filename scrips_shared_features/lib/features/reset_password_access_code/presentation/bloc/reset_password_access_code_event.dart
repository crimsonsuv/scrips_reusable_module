import 'package:meta/meta.dart';

@immutable
abstract class ResetPasswordAccessCodeEvent {}

class SignupWithCodeEvent extends ResetPasswordAccessCodeEvent {
  final String email;
  final String code;
  SignupWithCodeEvent({@required this.email, @required this.code});
}

class EnabledButtonEvent extends ResetPasswordAccessCodeEvent {
  final String email;
  final String code;
  EnabledButtonEvent({this.email, this.code});
}

class OAuthLoginEvent extends ResetPasswordAccessCodeEvent {}

class ResendCodeCallEvent extends ResetPasswordAccessCodeEvent {
  final String email;
  ResendCodeCallEvent({
    this.email,
  });
}
