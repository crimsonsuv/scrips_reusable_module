import 'package:dartz/dartz.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
