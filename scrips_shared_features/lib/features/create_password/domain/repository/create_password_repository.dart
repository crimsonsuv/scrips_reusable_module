import 'package:dartz/dartz.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';

abstract class CreatePasswordRepository {
  Future<Either<Failure, Success>> setPassword(
      {String email, String password, String passwordResetToken});
}
