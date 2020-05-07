import 'package:dartz/dartz.dart';
import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';

abstract class PatientsListRepository {
  Future<Either<Failure, PatientsList>> fetchPatients(
      {String orgId,
      bool isArchived,
      String practiceId,
      String query,
      int pageNum,
      bool status,
      int pageSize});

  Future<Either<Failure, Success>> archivePatient({List<String> patientIDs});
}
