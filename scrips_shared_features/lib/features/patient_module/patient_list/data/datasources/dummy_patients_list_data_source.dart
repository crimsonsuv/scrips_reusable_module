import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datasources/patients_list_data_source.dart';

class DummyPatientsDataSourceImpl extends PatientsListDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<PatientsList> getPatients(
      {String orgId,
      String practiceId,
      String query,
      int pageNum,
      int pageSize,
      bool status,
      bool isArchived}) {
    // TODO: implement getPatients
    throw UnimplementedError();
  }

  @override
  Future<Status> archivePatient({List<String> patientIDs}) {
    // TODO: implement archivePatient
    throw UnimplementedError();
  }
}
