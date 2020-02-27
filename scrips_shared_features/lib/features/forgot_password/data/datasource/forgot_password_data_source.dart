import 'package:scrips_shared_features/core/constants/status_objects.dart';

abstract class ForgotPasswordDataSource {
  Future<Success> forgotPassword({String email});
}
