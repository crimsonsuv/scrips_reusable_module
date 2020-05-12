import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/landing/data/datasources/landing_data_source.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

class LandingRepositoryImpl extends LandingRepository {
  LandingDataSource landingDataSource;

  LandingRepositoryImpl({@required this.landingDataSource});

  @override
  Future<Either<Failure, LoginUserData>> getLoggedUser() async {
    final result = await landingDataSource.getLoggedUser();

    try {
      return Right(result);
    } on Failure {
      return Left(Failure(""));
    }
  }
}
