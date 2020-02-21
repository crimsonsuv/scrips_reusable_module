import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class OAuthLoginUseCase implements UseCase<LoginTokens, NoParams> {
  final LoginRepository loginRepository;

  OAuthLoginUseCase({@required this.loginRepository});

  @override
  Future<Either<Failure, LoginTokens>> call(NoParams params) {
    return loginRepository.oauth2Login();
  }
}
