import 'package:meta/meta.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';

@immutable
abstract class CreateEditPatientEvent {}

class ChangeTabIndexEvent extends CreateEditPatientEvent {
  final int index;
  ChangeTabIndexEvent(this.index);
}

class ChangePatientTypeEvent extends CreateEditPatientEvent {
  final bool isMinor;
  ChangePatientTypeEvent(this.isMinor);
}

class SelectPatientRecordEvent extends CreateEditPatientEvent {
  final int index;
  SelectPatientRecordEvent(this.index);
}

class FetchGendersEvent extends CreateEditPatientEvent {}

class FetchIdTypeEvent extends CreateEditPatientEvent {}

class FetchLanguageEvent extends CreateEditPatientEvent {}

class FetchMaritalStatusEvent extends CreateEditPatientEvent {}

class FetchRelationshipEvent extends CreateEditPatientEvent {}

class FetchPatientEvent extends CreateEditPatientEvent {
  final String pid;
  FetchPatientEvent({this.pid});
}

class UpdatePatientEvent extends CreateEditPatientEvent {
  final String pid;
  final Patient patient;
  UpdatePatientEvent({this.patient, this.pid});
}

class EnablePatientSaveEvent extends CreateEditPatientEvent {
  final Patient patient;
  final int matchingRecordCount;
  EnablePatientSaveEvent({this.patient, this.matchingRecordCount = 0});
}

class FetchOwnershipEvent extends CreateEditPatientEvent {}

class FetchInsuranceEvent extends CreateEditPatientEvent {}

class FetchMatchingRecordsEvent extends CreateEditPatientEvent {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String idType;
  final String idNumber;
  FetchMatchingRecordsEvent(
      {this.firstName,
      this.lastName,
      this.birthDate,
      this.gender,
      this.idType,
      this.idNumber});
}

class SortPatientItemsEvent extends CreateEditPatientEvent {
  final sortType sort;

  SortPatientItemsEvent({@required this.sort});
}

class UseRecordAnywayEvent extends CreateEditPatientEvent {}

class FetchSelectedPatientEvent extends CreateEditPatientEvent {
  final String pid;
  FetchSelectedPatientEvent({this.pid});
}

class CreatePatientEvent extends CreateEditPatientEvent {
  final Patient patient;
  CreatePatientEvent({this.patient});
}

class CreateContactDetailsEvent extends CreateEditPatientEvent {
  final Patient patient;
  CreateContactDetailsEvent({this.patient});
}

class FetchEmergencyContactsEvent extends CreateEditPatientEvent {
  final String patientId;
  FetchEmergencyContactsEvent({this.patientId});
}

class FetchInsuranceListEvent extends CreateEditPatientEvent {
  final String patientId;
  FetchInsuranceListEvent({this.patientId});
}

class SaveEmergencyContactsEvent extends CreateEditPatientEvent {
  final List<EmergencyContactList> emergencyContacts;
  SaveEmergencyContactsEvent({this.emergencyContacts});
}

class SaveInsuranceListEvent extends CreateEditPatientEvent {
  final List<InsuranceList> insuranceList;
  SaveInsuranceListEvent({this.insuranceList});
}

class EnableSaveInsuranceEvent extends CreateEditPatientEvent {
  final InsuranceList insurance;
  EnableSaveInsuranceEvent({this.insurance});
}

class EnableSaveEmergencyContactEvent extends CreateEditPatientEvent {
  final EmergencyContactList emergencyContact;
  EnableSaveEmergencyContactEvent({this.emergencyContact});
}

class UpdateInsuranceListEvent extends CreateEditPatientEvent {
  final Patient patient;
  UpdateInsuranceListEvent({this.patient});
}

class UpdateEmergencyContactListEvent extends CreateEditPatientEvent {
  final Patient patient;
  UpdateEmergencyContactListEvent({this.patient});
}

class UploadImageEvent extends CreateEditPatientEvent {
  final String path;
  UploadImageEvent({this.path});
}

class ShowErrorMessageEvent extends CreateEditPatientEvent {
  final String message;
  ShowErrorMessageEvent({this.message});
}
