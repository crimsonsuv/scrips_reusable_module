import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datasources/patients_list_data_source.dart';

class PatientsListDataSourceImpl extends PatientsListDataSource {
  int _defaultTimeout = 20;
  static final endpoint = patientsServer;
  Dio client = Dio();

  @override
  Future<PatientsList> getPatients(
      {String orgId,
      String practiceId,
      String query,
      int pageNum,
      bool status,
      int pageSize,
      bool isArchived}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };

    String apiLink = '';

    if (query.length > 0) {
      if (status != null) {
        apiLink =
            '$endpoint/api/Patients/GetPatientList?OrganizationId=$orgId&Search=$query&IsArchived=$isArchived&PageNumber=$pageNum&PageSize=$pageSize&Status=$status';
      } else {
        apiLink =
            '$endpoint/api/Patients/GetPatientList?OrganizationId=$orgId&Search=$query&IsArchived=$isArchived&PageNumber=$pageNum&PageSize=$pageSize';
      }
    } else {
      if (status != null) {
        apiLink =
            '$endpoint/api/Patients/GetPatientList?OrganizationId=$orgId&PracticeId=$practiceId&IsArchived=$isArchived&PageNumber=$pageNum&PageSize=$pageSize&Status=$status';
      } else {
        apiLink =
            '$endpoint/api/Patients/GetPatientList?OrganizationId=$orgId&PracticeId=$practiceId&IsArchived=$isArchived&PageNumber=$pageNum&PageSize=$pageSize';
      }
    }

    var response = await client
        .get(apiLink)
        .timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Something happened! Please retry in a few seconds.');
    });

    return patientsListFromJson(utf8.decode(response.data));
  }

  @override
  Future<Status> archivePatient({List<String> patientIDs}) async {
    client.options.responseType = ResponseType.bytes;
    client.options.headers = {
      'accept': 'text/plain',
      'Content-Type': 'application/json'
    };
    Map<String, dynamic> patientIds = {"patientIds": patientIDs};
    var body = jsonEncode(patientIds);

    var _ = await client
        .delete("$endpoint/api/Patients/ArchivePatient", data: body)
        .timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Something happened! Please retry in a few seconds.');
    });

    return Success("Successfully Deleted");
  }
}
