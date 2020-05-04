import 'package:dartz/dartz.dart';
import 'package:scrips_core/error/errors.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorClass, Type>> call(Params params);
}
