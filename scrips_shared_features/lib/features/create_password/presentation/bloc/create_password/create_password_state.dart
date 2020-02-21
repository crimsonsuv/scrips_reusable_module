import 'package:meta/meta.dart';

@immutable
abstract class CreatePasswordState {}

class InitialCreatePasswordState extends CreatePasswordState {}

class IsButtonEnabledState extends CreatePasswordState {
  final bool status;
  final bool valid;
  final String password;
  final String confirmPassword;
  IsButtonEnabledState(
      {this.status, this.password, this.confirmPassword, this.valid});
}

class CreatePasswordSuccessState extends CreatePasswordState {}

class LoadingBeginState extends CreatePasswordState {}

class LoadingEndState extends CreatePasswordState {}

class ErrorState extends CreatePasswordState {
  final String message;

  ErrorState(this.message);
}
