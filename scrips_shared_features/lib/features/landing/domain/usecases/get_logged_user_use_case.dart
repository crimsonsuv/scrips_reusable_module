import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';

class GetLoggedUserUseCase extends UseCase<User, NoParams> {
  LandingRepository landingRepository;

  GetLoggedUserUseCase({@required this.landingRepository});

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await landingRepository.getLoggedUser();
  }
}
