import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/repository/forgot_password_repository.dart';

class ForgotPasswordUseCase extends UseCase<Success, ForgotPasswordParams> {
  ForgotPasswordRepository repository;

  ForgotPasswordUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(ForgotPasswordParams params) {
    return repository.forgotPassword(email: params.email);
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;

  ForgotPasswordParams({
    @required this.email,
  }) : super([email]);
}
