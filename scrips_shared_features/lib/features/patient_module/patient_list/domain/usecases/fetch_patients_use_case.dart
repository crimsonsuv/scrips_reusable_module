import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/usecase/usecase.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/repository/patients_list_repository.dart';

class FetchPatientsUseCase extends UseCase<PatientsList, FetchPatientsParams> {
  PatientsListRepository repository;

  FetchPatientsUseCase({@required this.repository});

  @override
  Future<Either<Failure, PatientsList>> call(FetchPatientsParams params) {
    return repository.fetchPatients(
        orgId: params.orgId,
        practiceId: params.practiceId,
        isArchived: params.isArchived,
        query: params.query,
        pageSize: params.pageSize,
        pageNum: params.pageNum,
        status: params.status);
  }
}

class FetchPatientsParams extends Equatable {
  final String orgId;
  final bool isArchived;
  final String practiceId;
  final String query;
  final int pageNum;
  final int pageSize;
  final bool status;

  FetchPatientsParams({
    @required this.orgId,
    @required this.isArchived,
    @required this.practiceId,
    @required this.query,
    @required this.pageNum,
    @required this.pageSize,
    @required this.status,
  }) : super([orgId, isArchived, practiceId, query, pageNum, pageSize, status]);
}
