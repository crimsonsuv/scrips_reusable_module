part of 'landing_bloc.dart';

@immutable
abstract class LandingState {}

class InitialLandingState extends LandingState {}

class GetLoggedUserState extends LandingState {
  final LoginUserData user;

  GetLoggedUserState(this.user);
}

class OAuthLoginState extends LandingState {
  final LoginUserData userData;

  OAuthLoginState(this.userData);
}

class ErrorState extends LandingState {
  final String message;

  ErrorState(this.message);
}

class LoadingBeginState extends LandingState {}

class LoadingEndState extends LandingState {}
