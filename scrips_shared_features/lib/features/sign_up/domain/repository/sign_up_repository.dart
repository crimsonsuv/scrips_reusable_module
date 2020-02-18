import 'package:dartz/dartz.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/error/errors.dart';

abstract class SignUpRepository {
  Future<Either<ErrorClass, User>> getUser();
}
