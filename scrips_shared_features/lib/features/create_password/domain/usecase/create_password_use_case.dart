import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/create_password/domain/repository/create_password_repository.dart';

class CreatePasswordUseCase extends UseCase<Success, CreatePasswordParams> {
  CreatePasswordRepository repository;

  CreatePasswordUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(CreatePasswordParams params) {
    return repository.setPassword(
        email: params.email,
        passwordResetToken: params.passwordResetToken,
        password: params.password);
  }
}

class CreatePasswordParams extends Equatable {
  final String email;
  final String password;
  final String passwordResetToken;

  CreatePasswordParams({
    @required this.email,
    @required this.passwordResetToken,
    @required this.password,
  }) : super([email, passwordResetToken, password]);
}
