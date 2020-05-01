import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchInsuranceUseCase extends UseCase<List<Insurance>, NoParams> {
  CommonRepository repository;

  FetchInsuranceUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<Insurance>>> call(NoParams params) {
    return repository.insuranceList();
  }
}
