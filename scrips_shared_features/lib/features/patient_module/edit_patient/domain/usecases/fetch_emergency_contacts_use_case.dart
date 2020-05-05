import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class FetchEmergencyContactsUseCase
    extends UseCase<List<EmergencyContactList>, FetchEmergencyContactsParams> {
  PatientRepository repository;

  FetchEmergencyContactsUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<EmergencyContactList>>> call(
      FetchEmergencyContactsParams params) {
    return repository.getEmergencyContactList(patientId: params.pid);
  }
}

class FetchEmergencyContactsParams extends Equatable {
  final String pid;

  FetchEmergencyContactsParams({
    @required this.pid,
  }) : super([pid]);
}
