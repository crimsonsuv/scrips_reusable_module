import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
