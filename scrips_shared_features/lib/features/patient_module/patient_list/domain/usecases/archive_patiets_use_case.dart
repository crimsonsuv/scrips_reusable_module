import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/repository/patients_list_repository.dart';

class ArchivePatientsUseCase extends UseCase<Success, ArchivePatientsParams> {
  PatientsListRepository repository;

  ArchivePatientsUseCase({@required this.repository});

  Future<Either<Failure, Success>> call(ArchivePatientsParams params) {
    return repository.archivePatient(patientIDs: params.patientIDs);
  }
}

class ArchivePatientsParams extends Equatable {
  final List<String> patientIDs;

  ArchivePatientsParams({
    @required this.patientIDs,
  }) : super([patientIDs]);
}
