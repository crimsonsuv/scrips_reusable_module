import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/register_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class RegisterProviderUseCase extends UseCase<Success, RegisterProviderParams> {
  CommonRepository repository;

  RegisterProviderUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(RegisterProviderParams params) {
    return repository.registerProvider(registerModel: params.registerModel);
  }
}

class RegisterProviderParams extends Equatable {
  final RegisterModel registerModel;

  RegisterProviderParams({
    @required this.registerModel,
  }) : super([registerModel]);
}
