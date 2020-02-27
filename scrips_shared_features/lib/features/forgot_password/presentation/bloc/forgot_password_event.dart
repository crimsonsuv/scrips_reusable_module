import 'package:meta/meta.dart';

@immutable
abstract class ForgotPasswordEvent {}

class ForgotPasswordCallEvent extends ForgotPasswordEvent {
  final String email;
  ForgotPasswordCallEvent({
    this.email,
  });
}

class EnabledButtonEvent extends ForgotPasswordEvent {
  final String email;
  EnabledButtonEvent({this.email});
}

class OAuthLoginEvent extends ForgotPasswordEvent {}
