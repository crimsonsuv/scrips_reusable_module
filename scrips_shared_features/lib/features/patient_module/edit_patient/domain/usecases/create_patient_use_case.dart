import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class CreatePatientUseCase
    extends UseCase<CreatePatientResponse, CreatePatientParams> {
  PatientRepository repository;

  CreatePatientUseCase({@required this.repository});

  @override
  Future<Either<Failure, CreatePatientResponse>> call(
      CreatePatientParams params) {
    return repository.createPatient(patient: params.patient);
  }
}

class CreatePatientParams extends Equatable {
  final Patient patient;

  CreatePatientParams({@required this.patient}) : super([patient]);
}
