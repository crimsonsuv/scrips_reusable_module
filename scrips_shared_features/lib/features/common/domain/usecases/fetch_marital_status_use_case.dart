import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchMaritalStatusUseCase extends UseCase<List<MaritalStatus>, NoParams> {
  CommonRepository repository;

  FetchMaritalStatusUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<MaritalStatus>>> call(NoParams params) {
    return repository.maritalList();
  }
}
