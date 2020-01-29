import 'package:dartz/dartz.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/error/errors.dart';
abstract class CommonRepository {
  Future<Either<ErrorClass, Locations>> fetchLocationsByQuery({String query});
}
