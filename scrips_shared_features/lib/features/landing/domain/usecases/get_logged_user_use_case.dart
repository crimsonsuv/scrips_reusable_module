import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

class GetLoggedUserUseCase extends UseCase<LoginUserData, NoParams> {
  LandingRepository landingRepository;

  GetLoggedUserUseCase({@required this.landingRepository});

  Future<Either<Failure, LoginUserData>> call(NoParams params) async {
    return await landingRepository.getLoggedUser();
  }
}
