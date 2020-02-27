import 'package:dartz/dartz.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, Success>> forgotPassword({String email});
}
