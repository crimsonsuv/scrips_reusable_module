import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';

abstract class PatientDataSource {
  Future<Patient> getPatientData({String patientId});
  Future<Status> updatePatientData({Patient patient, String id});
  Future<List<MatchingPatient>> fetchMatchingRecords(
      {String firstName,
      String lastName,
      DateTime birthDate,
      String gender,
      String idType,
      String idNumber});
  Future<List<InsuranceList>> getInsuranceList({String patientId});
  Future<List<EmergencyContactList>> getEmergencyContactList(
      {String patientId});
  Future<Status> saveInsuranceList({List<InsuranceList> insuranceList});
  Future<Status> saveEmergencyContactList(
      {List<EmergencyContactList> emergencyList});
  Future<CreatePatientResponse> createPatient({Patient patient});
  Future<Success> createContactDetails({Patient patient});
  Future<String> uploadImage({String path});
}
