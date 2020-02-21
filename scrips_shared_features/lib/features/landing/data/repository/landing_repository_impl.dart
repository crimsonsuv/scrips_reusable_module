import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/features/landing/data/datasources/landing_data_source.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';

class LandingRepositoryImpl extends LandingRepository {
  LandingDataSource landingDataSource;

  LandingRepositoryImpl({@required this.landingDataSource});

  @override
  Future<Either<Failure, User>> getLoggedUser() async {
    final result = await landingDataSource.getLoggedUser();

    try {
      return Right(result);
    } on CacheError {
      return Left(Failure(""));
    }
  }
}
