import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datasources/patient_data_source.dart';

class PatientDataSourceImpl extends PatientDataSource {
  static final endpoint = patientsServer;
  int _timeout = 50;
  Dio client = Dio();

  @override
  Future<Patient> getPatientData({String patientId}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    var response = await client
        .get(
      '$endpoint/api/Patients/$patientId',
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch Patient $patientId');
    });
    return patientFromJson(utf8.decode(response.data));
  }

  @override
  Future<Status> updatePatientData({Patient patient, String id}) async {
    Map<String, dynamic> patientData = patient.toJson();

    patient.emergencyContactResponse.removeWhere((data) {
      return data.emergencyContactId == null &&
          (isBlank(data.firstName) ||
              isBlank(data.lastName) ||
              isBlank(data.contactNumber));
    });

    patient.healthInsuranceResponse.removeWhere((data) {
      return data.healthInsuranceId == null &&
          (isBlank(data.insuranceProvider) ||
              isBlank(data.policyNumber) ||
              data.expirationDate == null);
    });

    var idata = jsonEncode(patient.healthInsuranceResponse);
    var resp1 = await client
        .post('$endpoint/api/patients/HealthInsurance?PatientId=$id',
            data: idata)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save health insurance');
    });

    var edata = jsonEncode(patient.emergencyContactResponse);
    var resp2 = await client
        .post('$endpoint/api/patients/EmergencyContact?PatientId=$id',
            data: edata)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save emergency contacts');
    });

    patientData.removeWhere((key, value) => key == "emergencyContactResponse");
    patientData.removeWhere((key, value) => key == "healthInsuranceResponse");

    var patientBody = jsonEncode(patientData);

    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'application/json',
      'content-type': 'application/json'
    };
    var resp3 = await client
        .put('$endpoint/api/Patients/$id', data: patientBody)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot update Patient $id');
    });
    return Success('Patient Updated');
  }

  @override
  Future<List<MatchingPatient>> fetchMatchingRecords(
      {String firstName,
      String lastName,
      DateTime birthDate,
      String gender,
      String idType,
      String idNumber}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    String queryString = "";

    if (idType != null) {
      queryString += "IDType=${idType == null ? "" : idType}";
    }
    if (idNumber != null) {
      queryString += "&IDNumber=${idNumber == null ? "" : idNumber}";
    }
    if (firstName != null) {
      queryString += "&FirstName=${firstName == null ? "" : firstName}";
    }
    if (lastName != null) {
      queryString += "&LastName=${lastName == null ? "" : lastName}";
    }
    if (birthDate != null) {
      queryString +=
          "&BirthDate=${birthDate == null ? "" : birthDate.toIso8601String()}";
    }

    var response = await client
        .get(
      '$endpoint/api/Patients/Validate?$queryString',
    )
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch data');
    });
    return matchingPatientFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<EmergencyContactList>> getEmergencyContactList(
      {String patientId}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    var response = await client
        .get('$endpoint/api/Patients/EmergencyContactList/$patientId')
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch emergency contacts');
    });
    return emergencyContactListFromJson(utf8.decode(response.data));
  }

  @override
  Future<List<InsuranceList>> getInsuranceList({String patientId}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    var response = await client
        .get('$endpoint/api/Patients/HealthInsuranceList/$patientId')
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch emergency contacts');
    });
    return insuranceListFromJson(utf8.decode(response.data));
  }

  @override
  Future<Status> saveEmergencyContactList(
      {List<EmergencyContactList> emergencyList}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    var data = jsonEncode(emergencyList);

    var _ = await client
        .post('$endpoint/api/patients/EmergencyContact', data: data)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save emergency contacts');
    });
    return Success('');
  }

  @override
  Future<Status> saveInsuranceList({List<InsuranceList> insuranceList}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    var data = jsonEncode(insuranceList);

    var _ = await client
        .post('$endpoint/api/patients/HealthInsurance', data: data)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save health insurance');
    });
    return Success('');
  }

  @override
  Future<CreatePatientResponse> createPatient({Patient patient}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    Map<String, dynamic> patientData = patient.toJson();
    patientData
        .removeWhere((key, value) => key == "updatePatientContactRequest");
    patientData.removeWhere((key, value) => key == "emergencyContactResponse");
    patientData.removeWhere((key, value) => key == "healthInsuranceResponse");
    var patientBody = jsonEncode(patientData);

    var response = await client
        .post('$endpoint/api/patients', data: patientBody)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save patient');
    });
    return createPatientResponseFromJson(utf8.decode(response.data));
  }

  @override
  Future<Success> createContactDetails({Patient patient}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    patient.emergencyContactResponse.removeWhere((data) {
      return data.emergencyContactId == null &&
          (isBlank(data.firstName) ||
              isBlank(data.lastName) ||
              isBlank(data.contactNumber));
    });

    patient.healthInsuranceResponse.removeWhere((data) {
      return data.healthInsuranceId == null &&
          (isBlank(data.insuranceProvider) ||
              isBlank(data.policyNumber) ||
              data.expirationDate == null);
    });

    var idata = jsonEncode(patient.healthInsuranceResponse);
    var resp1 = await client
        .post(
            '$endpoint/api/patients/HealthInsurance?PatientId=${patient.patientId}',
            data: idata)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save health insurance');
    });

    var edata = jsonEncode(patient.emergencyContactResponse);
    var resp2 = await client
        .post(
            '$endpoint/api/patients/EmergencyContact?PatientId=${patient.patientId}',
            data: edata)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save emergency contacts');
    });

    Map<String, dynamic> contactData =
        patient.updatePatientContactRequest.toJson();

    contactData.removeWhere((key, value) => key == "contactId");

    var body = jsonEncode(contactData);

    var _ = await client
        .post('$endpoint/api/Patients/ContactDetails', data: body)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot save patient');
    });
    return Success('Contact Details created');
  }

  @override
  Future<String> uploadImage({String path}) async {
    client.options.responseType = ResponseType.json;
    var formData = FormData.fromMap({
      "files": await MultipartFile.fromFile("${path}",
          filename: "${path.split('/').last}"),
    });
    var response = await client
        .post("$endpoint/api/Patients/Upload", data: formData)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Image upload failed');
    });
    return response.data;
  }
}
