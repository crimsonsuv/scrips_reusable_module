import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class SaveEmergencyContactsUseCase
    extends UseCase<Success, SaveEmergencyContactsParams> {
  PatientRepository repository;

  SaveEmergencyContactsUseCase({@required this.repository});

  @override
  Future<Either<Failure, Success>> call(SaveEmergencyContactsParams params) {
    return repository.saveEmergencyContactList(
        emergencyList: params.emergencyContactList);
  }
}

class SaveEmergencyContactsParams extends Equatable {
  final List<EmergencyContactList> emergencyContactList;

  SaveEmergencyContactsParams({@required this.emergencyContactList})
      : super([emergencyContactList]);
}
