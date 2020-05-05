import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class CreatePContactDetailsUseCase
    extends UseCase<Success, CreatePContactDetailsParams> {
  PatientRepository repository;

  CreatePContactDetailsUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(CreatePContactDetailsParams params) {
    return repository.createContactDetails(patient: params.patient);
  }
}

class CreatePContactDetailsParams extends Equatable {
  final Patient patient;

  CreatePContactDetailsParams({@required this.patient}) : super([patient]);
}
