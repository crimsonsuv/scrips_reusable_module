import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class GetLoginResponseUseCase implements UseCase<LoginUserData, Params> {
  final LoginRepository loginRepository;

  GetLoginResponseUseCase({@required this.loginRepository});

  @override
  Future<Either<Failure, LoginUserData>> call(Params params) {
    return loginRepository.getLoginResponse(
      params.email,
      params.password,
    );
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({
    @required this.email,
    @required this.password,
  }) : super([email, password]);
}
