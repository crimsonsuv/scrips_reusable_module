import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchRelationshipUseCase extends UseCase<List<Relationship>, NoParams> {
  CommonRepository repository;

  FetchRelationshipUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<Relationship>>> call(NoParams params) {
    return repository.relationshipList();
  }
}
