import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/degree_list_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchDegreeUseCase extends UseCase<List<DegreeValueSet>, QueryParams> {
  CommonRepository repository;

  FetchDegreeUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<DegreeValueSet>>> call(QueryParams params) {
    return repository.degreeList(params.query);
  }
}
