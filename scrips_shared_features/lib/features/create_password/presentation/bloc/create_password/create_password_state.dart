import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';

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

class UserDataSuccessState extends CreatePasswordState {
  final SignUpUserData userData;
  UserDataSuccessState({this.userData});
}

class LoadingBeginState extends CreatePasswordState {}

class LoadingEndState extends CreatePasswordState {}

class ErrorState extends CreatePasswordState {
  final String message;

  ErrorState(this.message);
}

class LoadingScreenBeginState extends CreatePasswordState {}

class LoadingScreenEndState extends CreatePasswordState {}
