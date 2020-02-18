part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class InitialSignUpState extends SignUpState {}

class GetUserSignUpState extends SignUpState {
  final User user;

  GetUserSignUpState(this.user);
}

class SignUpDummyDataState extends SignUpState {
  final String accessCode;
  SignUpDummyDataState(this.accessCode);
}

class ErrorState extends SignUpState {
  final String message;

  ErrorState(this.message);
}
