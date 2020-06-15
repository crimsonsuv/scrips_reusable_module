import 'package:meta/meta.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/create_patient_response_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/pages/patient_list_screen.dart';

@immutable
abstract class CreateEditPatientState {}

class InitialCreateEditPatientState extends CreateEditPatientState {}

class SelectedTabState extends CreateEditPatientState {
  final int index;
  SelectedTabState(this.index);
}

class ErrorState extends CreateEditPatientState {
  final String message;

  ErrorState(this.message);
}

class SelectedPatientTypeState extends CreateEditPatientState {
  final bool isMinor;
  SelectedPatientTypeState(this.isMinor);
}

class SelectedPatientRecord extends CreateEditPatientState {
  final int index;
  SelectedPatientRecord(this.index);
}

class FetchPatientState extends CreateEditPatientState {
  final Patient patient;
  FetchPatientState(this.patient);
}

class FetchGendersState extends CreateEditPatientState {
  final List<Gender> genderList;
  FetchGendersState(this.genderList);
}

class FetchIdTypeState extends CreateEditPatientState {
  final List<IdType> idTypeList;
  FetchIdTypeState(this.idTypeList);
}

class FetchLanguageState extends CreateEditPatientState {
  final List<LanguageValueSetList> languageList;
  FetchLanguageState(this.languageList);
}

class FetchMaritalStatusState extends CreateEditPatientState {
  final List<MaritalStatus> maritalList;
  FetchMaritalStatusState(this.maritalList);
}

class FetchRelationshipState extends CreateEditPatientState {
  final List<Relationship> relationshipList;
  FetchRelationshipState(this.relationshipList);
}

class FetchOwnershipState extends CreateEditPatientState {
  final List<Ownership> ownershipList;
  FetchOwnershipState(this.ownershipList);
}

class FetchInsuranceState extends CreateEditPatientState {
  final List<Insurance> insuranceList;
  FetchInsuranceState(this.insuranceList);
}

class LoadingDropDownBeginState extends CreateEditPatientState {}

class LoadingDropDownEndState extends CreateEditPatientState {}

class LoadingBeginState extends CreateEditPatientState {}

class LoadingEndState extends CreateEditPatientState {}

class UpdatePatientSuccessState extends CreateEditPatientState {}

class EnablePatientSaveState extends CreateEditPatientState {
  final Patient patient;
  final bool status;
  EnablePatientSaveState({this.patient, this.status});
}

class FetchMatchingRecordsState extends CreateEditPatientState {
  final List<MatchingPatient> matchingRecords;
  FetchMatchingRecordsState({this.matchingRecords});
}

class LoadingMatchingRecordsBeginState extends CreateEditPatientState {}

class LoadingMatchingRecordsEndState extends CreateEditPatientState {}

class SortedPatientItemsState extends CreateEditPatientState {
  final sortType sort;

  SortedPatientItemsState({this.sort});
}

class UseRecordAnywayState extends CreateEditPatientState {}

class FetchSelectedPatientState extends CreateEditPatientState {
  final Patient patient;
  FetchSelectedPatientState(this.patient);
}

class CreatePatientState extends CreateEditPatientState {
  final CreatePatientResponse response;
  CreatePatientState(this.response);
}

class CreateContactDetailsState extends CreateEditPatientState {}

class FetchEmergencyContactsState extends CreateEditPatientState {
  final List<EmergencyContactList> emergencyContactList;
  FetchEmergencyContactsState(this.emergencyContactList);
}

class FetchInsuranceListState extends CreateEditPatientState {
  final List<InsuranceList> insuranceList;
  FetchInsuranceListState(this.insuranceList);
}

class SaveEmergencyContactsState extends CreateEditPatientState {}

class SaveInsuranceListState extends CreateEditPatientState {}

class LoadingEmergencyContactsBeginState extends CreateEditPatientState {}

class LoadingEmergencyContactsEndState extends CreateEditPatientState {}

class LoadingInsuranceListBeginState extends CreateEditPatientState {}

class LoadingInsuranceListEndState extends CreateEditPatientState {}

class EnableSaveInsuranceState extends CreateEditPatientState {
  final bool status;
  final InsuranceList insurance;
  EnableSaveInsuranceState({this.insurance, this.status});
}

class EnableSaveEmergencyContactState extends CreateEditPatientState {
  final bool status;
  final EmergencyContactList emergencyContact;
  EnableSaveEmergencyContactState({this.emergencyContact, this.status});
}

class UpdateInsuranceListState extends CreateEditPatientState {
  final Patient patient;
  UpdateInsuranceListState({this.patient});
}

class UpdateEmergencyContactListState extends CreateEditPatientState {
  final Patient patient;
  UpdateEmergencyContactListState({this.patient});
}

class ImageUploadedState extends CreateEditPatientState {
  final String link;
  ImageUploadedState({this.link});
}

class UploadingImageBeginState extends CreateEditPatientState {}

class UploadingImageEndState extends CreateEditPatientState {}
