import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class FetchPatientUseCase extends UseCase<Patient, FetchPatientParams> {
  PatientRepository repository;

  FetchPatientUseCase({@required this.repository});

  @override
  Future<Either<Failure, Patient>> call(FetchPatientParams params) {
    return repository.getPatientData(patientId: params.pid);
  }
}

class FetchPatientParams extends Equatable {
  final String pid;

  FetchPatientParams({
    @required this.pid,
  }) : super([pid]);
}
