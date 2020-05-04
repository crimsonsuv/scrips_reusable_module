import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';

class SignUpUserDataUseCase
    extends UseCase<SignUpUserData, SignUpUserDataParams> {
  CreatePasswordRepository repository;

  SignUpUserDataUseCase({@required this.repository});

  @override
  Future<Either<Failure, SignUpUserData>> call(SignUpUserDataParams params) {
    return repository.signupUserData(
      email: params.email,
    );
  }
}

class SignUpUserDataParams extends Equatable {
  final String email;

  SignUpUserDataParams({
    @required this.email,
  }) : super([email]);
}
