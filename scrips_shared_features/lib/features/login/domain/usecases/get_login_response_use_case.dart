import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class GetLoginResponseUseCase implements UseCase<UserData, Params> {
  final LoginRepository loginRepository;

  GetLoginResponseUseCase({@required this.loginRepository});

  @override
  Future<Either<Failure, UserData>> call(Params params) {
    return loginRepository.getLoginResponse(
      params.context,
      params.email,
      params.password,
    );
  }
}

class Params extends Equatable {
  final BuildContext context;
  final String email;
  final String password;

  Params({
    @required this.context,
    @required this.email,
    @required this.password,
  }) : super([context, email, password]);
}
