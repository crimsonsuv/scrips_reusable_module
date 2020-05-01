import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/pages/patient_list_screen.dart';

@immutable
abstract class PatientListState {}

class InitialPatientListState extends PatientListState {}

class SetItemSelection extends PatientListState {
  final List<int> indexs;

  SetItemSelection({this.indexs});
}

class PracticeFetchByQueryState extends PatientListState {
  final PatientsList patientsList;

  PracticeFetchByQueryState(this.patientsList);
}

class ErrorState extends PatientListState {
  final String message;

  ErrorState(this.message);
}

class LoadingBeginState extends PatientListState {}

class LoadingEndState extends PatientListState {}

class SortedPatientItemsState extends PatientListState {
  final sortType sort;

  SortedPatientItemsState({this.sort});
}

class ChangeArchiveStatusState extends PatientListState {}

class ArchivedPatientState extends PatientListState {}
