import 'package:scrips_core/datamodels/user/user.dart';

class LoginResponse {
  final bool success;
  final User user;
  final String message;

  LoginResponse({this.success, this.user, this.message});
}
