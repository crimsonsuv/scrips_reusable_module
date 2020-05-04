import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';

abstract class ForgotPasswordRepository {
  Future<Either<Failure, Success>> forgotPassword({String email});
}
