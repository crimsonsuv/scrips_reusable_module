import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';

@immutable
abstract class PasswordChangedSuccessState {}

class InitialPasswordChangedSuccessState extends PasswordChangedSuccessState {}

class OAuthLoginState extends PasswordChangedSuccessState {
  final LoginTokens accessToken;

  OAuthLoginState(this.accessToken);
}

class LoginLoadingBeginState extends PasswordChangedSuccessState {}

class LoginLoadingEndState extends PasswordChangedSuccessState {}

class ErrorState extends PasswordChangedSuccessState {
  final String message;

  ErrorState(this.message);
}