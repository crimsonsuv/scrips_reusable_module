part of 'landing_bloc.dart';

@immutable
abstract class LandingState {}

class InitialLandingState extends LandingState {}

class GetLoggedUserState extends LandingState {
  final User user;

  GetLoggedUserState(this.user);
}

class ErrorState extends LandingState {
  final String message;

  ErrorState(this.message);
}
