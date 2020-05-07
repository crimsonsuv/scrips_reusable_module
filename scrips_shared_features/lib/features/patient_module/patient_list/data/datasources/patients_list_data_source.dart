import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';

abstract class PatientsListDataSource {
  Future<PatientsList> getPatients(
      {String orgId,
      String practiceId,
      String query,
      int pageNum,
      int pageSize,
      bool status,
      bool isArchived});

  Future<Status> archivePatient({List<String> patientIDs});
}
