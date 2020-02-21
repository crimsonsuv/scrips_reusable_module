part of 'landing_bloc.dart';

@immutable
abstract class LandingEvent {}

class GetLoggedUser extends LandingEvent {}

class OAuthLoginEvent extends LandingEvent {}
