import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class SaveInsuranceListUseCase
    extends UseCase<Success, SaveInsuranceListParams> {
  PatientRepository repository;

  SaveInsuranceListUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(SaveInsuranceListParams params) {
    return repository.saveInsuranceList(insuranceList: params.insuranceList);
  }
}

class SaveInsuranceListParams extends Equatable {
  final List<InsuranceList> insuranceList;

  SaveInsuranceListParams({@required this.insuranceList})
      : super([insuranceList]);
}
