import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/hospital_list_model.dart';
import 'package:scrips_shared_features/features/common/domain/repository/common_repository.dart';

class FetchHospitalListUseCase
    extends UseCase<List<HospitalList>, QueryParams> {
  CommonRepository repository;

  FetchHospitalListUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<HospitalList>>> call(QueryParams params) {
    return repository.hospitalList(params.query);
  }
}
