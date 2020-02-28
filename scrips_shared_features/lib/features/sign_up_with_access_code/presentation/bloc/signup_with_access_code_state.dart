import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';

@immutable
abstract class SignupWithAccessCodeState {}

class InitialSignupWithAccessCodeState extends SignupWithAccessCodeState {}

class SignupSuccessState extends SignupWithAccessCodeState {
  final SignupByCodeResponse signupByCodeResponse;
  SignupSuccessState({this.signupByCodeResponse});
}

class LoadingBeginState extends SignupWithAccessCodeState {}

class LoadingEndState extends SignupWithAccessCodeState {}

class ErrorState extends SignupWithAccessCodeState {
  final String message;

  ErrorState(this.message);
}

class IsButtonEnabledState extends SignupWithAccessCodeState {
  final bool status;
  final String email;
  final String code;
  IsButtonEnabledState({this.status, this.email, this.code});
}

class OAuthLoginState extends SignupWithAccessCodeState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class LoginLoadingBeginState extends SignupWithAccessCodeState {}

class LoginLoadingEndState extends SignupWithAccessCodeState {}
