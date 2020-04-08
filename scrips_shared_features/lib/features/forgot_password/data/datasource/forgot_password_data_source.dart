import 'package:scrips_core/constants/status_objects.dart';

abstract class ForgotPasswordDataSource {
  Future<Success> forgotPassword({String email});
}
