import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datasources/patient_data_source.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/domain/repository/patient_repository.dart';

class PatientRepositoryImpl extends PatientRepository {
  PatientDataSource patientDataSource;

  PatientRepositoryImpl({@required this.patientDataSource});

  @override
  Future<Either<Failure, Patient>> getPatientData({String patientId}) async {
    try {
      final result =
          await patientDataSource.getPatientData(patientId: patientId);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Success>> updatePatient(
      {Patient patient, String patientId}) async {
    try {
      final result = await patientDataSource.updatePatientData(
          patient: patient, id: patientId);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<MatchingPatient>>> fetchMatchingRecords(
      {String firstName,
      String lastName,
      DateTime birthDate,
      String gender,
      String idType,
      String idNumber}) async {
    try {
      final result = await patientDataSource.fetchMatchingRecords(
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
          gender: gender,
          idType: idType,
          idNumber: idNumber);
      if ((result?.length ?? 0) > 0) {
        return Right(result);
      } else {
        return Left(Failure("valid id"));
      }
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<EmergencyContactList>>> getEmergencyContactList(
      {String patientId}) async {
    try {
      final result =
          await patientDataSource.getEmergencyContactList(patientId: patientId);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, List<InsuranceList>>> getInsuranceList(
      {String patientId}) async {
    try {
      final result =
          await patientDataSource.getInsuranceList(patientId: patientId);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Status>> saveEmergencyContactList(
      {List<EmergencyContactList> emergencyList}) async {
    try {
      final result = await patientDataSource.saveEmergencyContactList(
          emergencyList: emergencyList);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Status>> saveInsuranceList(
      {List<InsuranceList> insuranceList}) async {
    try {
      final result = await patientDataSource.saveInsuranceList(
          insuranceList: insuranceList);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, Success>> createContactDetails(
      {Patient patient}) async {
    try {
      final result =
          await patientDataSource.createContactDetails(patient: patient);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, CreatePatientResponse>> createPatient(
      {Patient patient}) async {
    try {
      final result = await patientDataSource.createPatient(patient: patient);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage({String path}) async {
    try {
      final result = await patientDataSource.uploadImage(path: path);
      return Right(result);
    } on DioError catch (e) {
      return (Left(handleFailure(e)));
    } on Failure {
      return Left(Failure("Request time out.."));
    }
  }
}
