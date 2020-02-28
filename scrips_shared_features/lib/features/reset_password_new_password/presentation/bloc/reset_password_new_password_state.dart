import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

@immutable
abstract class ResetPasswordNewPasswordState {}

class InitialResetPasswordNewPasswordState
    extends ResetPasswordNewPasswordState {}

class IsButtonEnabledState extends ResetPasswordNewPasswordState {
  final bool status;
  final bool valid;
  final String password;
  final String confirmPassword;
  IsButtonEnabledState(
      {this.status, this.password, this.confirmPassword, this.valid});
}

class CreatePasswordSuccessState extends ResetPasswordNewPasswordState {}

class LoadingBeginState extends ResetPasswordNewPasswordState {}

class LoadingEndState extends ResetPasswordNewPasswordState {}

class ErrorState extends ResetPasswordNewPasswordState {
  final String message;

  ErrorState(this.message);
}

class OAuthLoginState extends ResetPasswordNewPasswordState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class LoginLoadingBeginState extends ResetPasswordNewPasswordState {}

class LoginLoadingEndState extends ResetPasswordNewPasswordState {}
