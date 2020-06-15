import 'package:meta/meta.dart';
import 'package:scrips_core/utils/utils.dart';

@immutable
abstract class PatientListEvent {}

class SelectPatientItems extends PatientListEvent {
  final List<int> indexs;

  SelectPatientItems({@required this.indexs});
}

class PatientsFetchByQueryEvent extends PatientListEvent {
  final String orgId;
  final bool isArchived;
  final String practiceId;
  final String query;
  final int pageNum;
  final int pageSize;

  PatientsFetchByQueryEvent(
      {@required this.orgId,
      @required this.practiceId,
      this.query,
      this.isArchived,
      this.pageNum,
      this.pageSize});
}

class SortPatientItemsEvent extends PatientListEvent {
  final sortType sort;

  SortPatientItemsEvent({@required this.sort});
}

class ChangeArchiveStatusEvent extends PatientListEvent {}

class ArchivePatientEvent extends PatientListEvent {
  final List<String> patientIDs;
  ArchivePatientEvent({this.patientIDs});
}
