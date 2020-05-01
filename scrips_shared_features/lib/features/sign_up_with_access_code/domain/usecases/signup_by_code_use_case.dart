import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/repository/sign_up_repository.dart';

class SignupByCodeUseCase
    extends UseCase<SignupByCodeResponse, SignupByCodeParams> {
  SignUpRepository repository;

  SignupByCodeUseCase({@required this.repository});

  @override
  Future<Either<Failure, SignupByCodeResponse>> call(
      SignupByCodeParams params) {
    return repository.signUpByCode(email: params.email, code: params.code);
  }
}

class SignupByCodeParams extends Equatable {
  final String email;
  final String code;

  SignupByCodeParams({
    @required this.email,
    @required this.code,
  }) : super([email, code]);
}
