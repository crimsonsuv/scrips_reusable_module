import 'package:meta/meta.dart';

@immutable
abstract class SignupWithAccessCodeEvent {}

class SignupWithCodeEvent extends SignupWithAccessCodeEvent {
  final String email;
  final String code;
  SignupWithCodeEvent({@required this.email, @required this.code});
}

class EnabledButtonEvent extends SignupWithAccessCodeEvent {
  final String email;
  final String code;
  EnabledButtonEvent({this.email, this.code});
}

class OAuthLoginEvent extends SignupWithAccessCodeEvent {}
