part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class GetUserSignUp extends SignUpEvent {}

class SetSignUpDummyData extends SignUpEvent {}
