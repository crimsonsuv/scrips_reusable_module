import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchIdTypeUseCase extends UseCase<List<IdType>, NoParams> {
  CommonRepository repository;

  FetchIdTypeUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<IdType>>> call(NoParams params) {
    return repository.idTypeList();
  }
}
