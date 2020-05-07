import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';

abstract class PatientRepository {
  Future<Either<Failure, Patient>> getPatientData({String patientId});
  Future<Either<Failure, Success>> updatePatient(
      {Patient patient, String patientId});
  Future<Either<Failure, List<MatchingPatient>>> fetchMatchingRecords(
      {String firstName,
      String lastName,
      DateTime birthDate,
      String gender,
      String idType,
      String idNumber});
  Future<Either<Failure, List<InsuranceList>>> getInsuranceList(
      {String patientId});
  Future<Either<Failure, List<EmergencyContactList>>> getEmergencyContactList(
      {String patientId});
  Future<Either<Failure, Status>> saveInsuranceList(
      {List<InsuranceList> insuranceList});
  Future<Either<Failure, Status>> saveEmergencyContactList(
      {List<EmergencyContactList> emergencyList});
  Future<Either<Failure, CreatePatientResponse>> createPatient(
      {Patient patient});
  Future<Either<Failure, Success>> createContactDetails({Patient patient});
  Future<Either<Failure, String>> uploadImage({String path});
}
