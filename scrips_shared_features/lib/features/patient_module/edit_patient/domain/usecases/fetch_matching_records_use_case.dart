import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class FetchMatchingPatientUseCase
    extends UseCase<List<MatchingPatient>, FetchMatchingPatientParams> {
  PatientRepository repository;

  FetchMatchingPatientUseCase({@required this.repository});

  @override
  Future<Either<Failure, List<MatchingPatient>>> call(
      FetchMatchingPatientParams params) {
    return repository.fetchMatchingRecords(
        firstName: params.firstName,
        lastName: params.lastName,
        birthDate: params.birthDate,
        gender: params.gender,
        idType: params.idType,
        idNumber: params.idNumber);
  }
}

class FetchMatchingPatientParams extends Equatable {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String idType;
  final String idNumber;

  FetchMatchingPatientParams({
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    @required this.idType,
    @required this.idNumber,
  }) : super([firstName, lastName, birthDate, gender, idType, idNumber]);
}
