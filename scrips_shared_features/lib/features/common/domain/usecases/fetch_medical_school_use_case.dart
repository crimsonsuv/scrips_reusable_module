import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/medical_schools_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchMedicalSchoolSetUseCase
    extends UseCase<List<MedicalSchools>, QueryParams> {
  CommonRepository repository;

  FetchMedicalSchoolSetUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<MedicalSchools>>> call(QueryParams params) {
    return repository.medicalSchoolList(params.query);
  }
}
