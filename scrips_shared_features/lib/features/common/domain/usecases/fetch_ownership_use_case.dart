import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchOwnershipUseCase extends UseCase<List<Ownership>, NoParams> {
  CommonRepository repository;

  FetchOwnershipUseCase({@required this.repository});

  Future<Either<Failure, List<Ownership>>> call(NoParams params) {
    return repository.ownershipList();
  }
}
