import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datasources/patient_data_source.dart';

class DummyPatientDataSourceImpl extends PatientDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<Patient> getPatientData({String patientId}) {
    // TODO: implement getPatientData
    throw UnimplementedError();
  }

  @override
  Future<Status> updatePatientData({Patient patient, String id}) {
    // TODO: implement updatePatientData
    throw UnimplementedError();
  }

  @override
  Future<List<MatchingPatient>> fetchMatchingRecords(
      {String firstName,
      String lastName,
      DateTime birthDate,
      String gender,
      String idType,
      String idNumber}) {
    // TODO: implement fetchMatchingRecords
    throw UnimplementedError();
  }

  @override
  Future<List<EmergencyContactList>> getEmergencyContactList(
      {String patientId}) {
    // TODO: implement getEmergencyContactList
    throw UnimplementedError();
  }

  @override
  Future<List<InsuranceList>> getInsuranceList({String patientId}) {
    // TODO: implement getInsuranceList
    throw UnimplementedError();
  }

  @override
  Future<Status> saveEmergencyContactList(
      {List<EmergencyContactList> emergencyList}) {
    // TODO: implement saveEmergencyContactList
    throw UnimplementedError();
  }

  @override
  Future<Status> saveInsuranceList({List<InsuranceList> insuranceList}) {
    // TODO: implement saveInsuranceList
    throw UnimplementedError();
  }

  @override
  Future<CreatePatientResponse> createPatient({Patient patient}) {
    // TODO: implement createPatient
    throw UnimplementedError();
  }

  @override
  Future<Success> createContactDetails({Patient patient}) {
    // TODO: implement createContactDetails
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImage({String path}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
