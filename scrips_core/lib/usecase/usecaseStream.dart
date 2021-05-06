import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';

abstract class UseCaseStream<Type, Params,Function> {
  Future<Either<Failure, Type>> call(Params params,Function function);
}
