import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_shared_features/core/error/errors.dart';
import 'package:scrips_shared_features/core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';

class GetLoginResponseUseCase implements UseCase<LoginResponse, Params> {
  final LoginRepository loginRepository;

  GetLoginResponseUseCase({@required this.loginRepository});

  @override
  Future<Either<ErrorClass, LoginResponse>> call(Params params) {
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
