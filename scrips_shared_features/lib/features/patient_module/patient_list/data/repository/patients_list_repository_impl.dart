import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datasources/patients_list_data_source.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/repository/patients_list_repository.dart';

class PatientsListRepositoryImpl extends PatientsListRepository {
  PatientsListDataSource patientsListDataSource;

  PatientsListRepositoryImpl({@required this.patientsListDataSource});

  @override
  Future<Either<Failure, PatientsList>> fetchPatients(
      {String orgId,
      bool isArchived,
      String practiceId,
      String query,
      int pageNum,
      bool status,
      int pageSize}) async {
    try {
      final result = await patientsListDataSource.getPatients(
          practiceId: practiceId,
          orgId: orgId,
          query: query,
          pageNum: pageNum,
          pageSize: pageSize,
          status: status,
          isArchived: isArchived);
      return Right(result);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return Right(PatientsList(count: 0, patientData: []));
      }
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Success>> archivePatient(
      {List<String> patientIDs}) async {
    try {
      final result =
          await patientsListDataSource.archivePatient(patientIDs: patientIDs);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
