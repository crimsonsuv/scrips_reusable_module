import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';

@immutable
abstract class ResetPasswordAccessCodeState {}

class InitialResetPasswordAccessCodeState extends ResetPasswordAccessCodeState {
}

class SignupSuccessState extends ResetPasswordAccessCodeState {
  final SignupByCodeResponse signupByCodeResponse;
  SignupSuccessState({this.signupByCodeResponse});
}

class ResendCodeSuccessState extends ResetPasswordAccessCodeState {}

class LoadingBeginState extends ResetPasswordAccessCodeState {}

class LoadingEndState extends ResetPasswordAccessCodeState {}

class ErrorState extends ResetPasswordAccessCodeState {
  final String message;

  ErrorState(this.message);
}

class IsButtonEnabledState extends ResetPasswordAccessCodeState {
  final bool status;
  final String email;
  final String code;
  IsButtonEnabledState({this.status, this.email, this.code});
}

class OAuthLoginState extends ResetPasswordAccessCodeState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class LoginLoadingBeginState extends ResetPasswordAccessCodeState {}

class LoginLoadingEndState extends ResetPasswordAccessCodeState {}

class LoadingScreenBeginState extends ResetPasswordAccessCodeState {}

class LoadingScreenEndState extends ResetPasswordAccessCodeState {}
