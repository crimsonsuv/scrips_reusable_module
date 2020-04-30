import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

@immutable
abstract class ForgotPasswordState {}

class InitialForgotPasswordState extends ForgotPasswordState {}

class ForgotPasswordSuccessState extends ForgotPasswordState {}

class LoadingBeginState extends ForgotPasswordState {}

class LoadingEndState extends ForgotPasswordState {}

class ErrorState extends ForgotPasswordState {
  final String message;

  ErrorState(this.message);
}

class IsButtonEnabledState extends ForgotPasswordState {
  final bool status;
  final String email;
  IsButtonEnabledState({this.status, this.email});
}

class OAuthLoginState extends ForgotPasswordState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class LoginLoadingBeginState extends ForgotPasswordState {}

class LoginLoadingEndState extends ForgotPasswordState {}
