import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class FetchInsuranceListUseCase
    extends UseCase<List<InsuranceList>, FetchInsuranceListParams> {
  PatientRepository repository;

  FetchInsuranceListUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<InsuranceList>>> call(
      FetchInsuranceListParams params) {
    return repository.getInsuranceList(patientId: params.pid);
  }
}

class FetchInsuranceListParams extends Equatable {
  final String pid;

  FetchInsuranceListParams({
    @required this.pid,
  }) : super([pid]);
}
