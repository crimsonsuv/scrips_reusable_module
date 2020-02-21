import 'package:scrips_shared_features/core/constants/status_objects.dart';

abstract class CreatePasswordDataSource {
  Future<Success> setPassword(
      {String email, String password, String passwordResetToken});
}
