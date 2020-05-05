import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class UpdatePatientUseCase extends UseCase<Success, UpdatePatientParams> {
  PatientRepository repository;

  UpdatePatientUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(UpdatePatientParams params) {
    return repository.updatePatient(
        patient: params.patient, patientId: params.pid);
  }
}

class UpdatePatientParams extends Equatable {
  final String pid;
  final Patient patient;

  UpdatePatientParams({@required this.pid, @required this.patient})
      : super([pid]);
}
