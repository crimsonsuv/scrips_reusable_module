import 'package:dartz/dartz.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';

abstract class LandingRepository {
  Future<Either<Failure, User>> getLoggedUser();
}
