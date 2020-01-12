import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/landing/domain/repository/landing_repository.dart';

class GetLoggedUserUseCase extends UseCase<User, NoParams> {
  LandingRepository landingRepository;

  GetLoggedUserUseCase({@required this.landingRepository});

  @override
  Future<Either<ErrorClass, User>> call(NoParams params) async {
    return await landingRepository.getLoggedUser();
  }
}
