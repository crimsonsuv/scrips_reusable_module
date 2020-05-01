import 'package:meta/meta.dart';

@immutable
abstract class PasswordChangedSuccessEvent {}


class OAuthLoginEvent extends PasswordChangedSuccessEvent {}