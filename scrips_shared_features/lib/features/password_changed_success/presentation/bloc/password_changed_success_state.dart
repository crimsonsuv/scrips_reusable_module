import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

@immutable
abstract class PasswordChangedSuccessState {}

class InitialPasswordChangedSuccessState extends PasswordChangedSuccessState {}

class OAuthLoginState extends PasswordChangedSuccessState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class LoginLoadingBeginState extends PasswordChangedSuccessState {}

class LoginLoadingEndState extends PasswordChangedSuccessState {}

class ErrorState extends PasswordChangedSuccessState {
  final String message;

  ErrorState(this.message);
}