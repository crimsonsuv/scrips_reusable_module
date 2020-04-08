import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_gender_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_idtype_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_insurace_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_language_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_maritial_status_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_ownership_use_case.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_relationship_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/create_contact_details_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/create_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/fetch_emergency_contacts_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/fetch_insurance_list_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/fetch_matching_records_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/fetch_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/save_emergency_contacts_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/save_insurance_list_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/update_patient_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/domain/usecases/upload_image_use_case.dart';

import './bloc.dart';

class CreateEditPatientBloc
    extends Bloc<CreateEditPatientEvent, CreateEditPatientState> {
  @override
  CreateEditPatientState get initialState => InitialCreateEditPatientState();

  final FetchGenderUseCase fetchGenderUseCase;
  final FetchRelationshipUseCase fetchRelationshipUseCase;
  final FetchMaritialStatusUseCase fetchMaritialStatusUseCase;
  final FetchIdTypeUseCase fetchIdTypeUseCase;
  final FetchLanguageUseCase fetchLanguageUseCase;
  final FetchPatientUseCase fetchPatientUseCase;
  final FetchOwnershipUseCase fetchOwnershipUseCase;
  final FetchInsuranceUseCase fetchInsuranceUseCase;
  final UpdatePatientUseCase updatePatientUseCase;
  final FetchMatchingPatientUseCase fetchMatchingPatientUseCase;
  final FetchEmergencyContactsUseCase fetchEmergencyContactsUseCase;
  final FetchInsuranceListUseCase fetchInsuranceListUseCase;
  final CreatePatientUseCase createPatientUseCase;
  final CreatePContactDetailsUseCase createContactDeatilsUseCase;
  final SaveEmergencyContactsUseCase saveEmergencyContactsUseCase;
  final SaveInsuranceListUseCase saveInsuranceListUseCase;
  final UploadImageUseCase uploadImageUseCase;

  CreateEditPatientBloc(
      {@required this.fetchGenderUseCase,
      @required this.fetchRelationshipUseCase,
      @required this.fetchMaritialStatusUseCase,
      @required this.fetchIdTypeUseCase,
      @required this.fetchLanguageUseCase,
      @required this.fetchPatientUseCase,
      @required this.fetchOwnershipUseCase,
      @required this.fetchInsuranceUseCase,
      @required this.updatePatientUseCase,
      @required this.fetchMatchingPatientUseCase,
      @required this.fetchInsuranceListUseCase,
      @required this.fetchEmergencyContactsUseCase,
      @required this.createContactDeatilsUseCase,
      @required this.createPatientUseCase,
      @required this.saveInsuranceListUseCase,
      @required this.saveEmergencyContactsUseCase,
      this.uploadImageUseCase});

  @override
  Stream<CreateEditPatientState> mapEventToState(
    CreateEditPatientEvent event,
  ) async* {
    if (event is ChangeTabIndexEvent) {
      yield SelectedTabState(event.index);
    } else if (event is ChangePatientTypeEvent) {
      yield SelectedPatientTypeState(event.isMinor);
    } else if (event is SelectPatientRecordEvent) {
      yield SelectedPatientRecord(event.index);
    } else if (event is FetchGendersEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchGenderUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchGendersState(success),
      );
    } else if (event is FetchIdTypeEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchIdTypeUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchIdTypeState(success),
      );
    } else if (event is FetchLanguageEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchLanguageUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchLanguageState(success),
      );
    } else if (event is FetchMaritalStatusEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchMaritialStatusUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchMaritalStatusState(success),
      );
    } else if (event is FetchRelationshipEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchRelationshipUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchRelationshipState(success),
      );
    } else if (event is FetchPatientEvent) {
      yield LoadingBeginState();
      final result =
          await fetchPatientUseCase(FetchPatientParams(pid: event.pid));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchPatientState(success),
      );
    } else if (event is FetchOwnershipEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchOwnershipUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchOwnershipState(success),
      );
    } else if (event is FetchInsuranceEvent) {
      yield LoadingDropDownBeginState();
      final result = await fetchInsuranceUseCase(NoParams());
      yield LoadingDropDownEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchInsuranceState(success),
      );
    } else if (event is UpdatePatientEvent) {
      yield LoadingBeginState();
      final result = await updatePatientUseCase(
          UpdatePatientParams(pid: event.pid, patient: event.patient));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => UpdatePatientSuccessState(),
      );
    } else if (event is EnablePatientSaveEvent) {
      bool status = event.patient.isAdult != null &&
          !isBlank(event.patient.firstName) &&
          !isBlank(event.patient.lastName) &&
          !isBlank(event.patient.gender) &&
          event.patient.birthDate != null;

      status = status &&
          (event.patient.isAdult
              ? (!isBlank(event.patient.identification.idType) &&
                  !isBlank(event.patient.identification.idNumber) &&
                  event.patient.identification.idExpirationDate != null)
              : (!isBlank(event.patient.guardianIdenitification.firstName) &&
                  !isBlank(event.patient.guardianIdenitification.lastName) &&
                  event.patient.guardianIdenitification.birthDate != null &&
                  !isBlank(event.patient.guardianIdenitification.gender) &&
                  !isBlank(event.patient.guardianIdenitification.idType) &&
                  !isBlank(event.patient.guardianIdenitification.idNumber) &&
                  event.patient.guardianIdenitification.idExpirationDate !=
                      null));

      if (event.patient.patientId == null) {
        status = status;
      } else {
        status = status &&
            (!isBlank(
                    event.patient.updatePatientContactRequest.primaryContact) &&
                !isBlank(event.patient.updatePatientContactRequest.ownership));
      }

      status = status && (event.matchingRecordCount == 0);

      yield EnablePatientSaveState(patient: event.patient, status: status);
    } else if (event is FetchMatchingRecordsEvent) {
      yield LoadingMatchingRecordsBeginState();
      final result = await fetchMatchingPatientUseCase(
          FetchMatchingPatientParams(
              firstName: event.firstName,
              lastName: event.lastName,
              birthDate: event.birthDate,
              gender: event.gender,
              idNumber: event.idNumber,
              idType: event.idType));
      yield LoadingMatchingRecordsEndState();
      yield result.fold(
        (error) => LoadingMatchingRecordsEndState(),
        (success) => FetchMatchingRecordsState(matchingRecords: success),
      );
    } else if (event is UseRecordAnywayEvent) {
      yield UseRecordAnywayState();
    } else if (event is FetchSelectedPatientEvent) {
      yield LoadingBeginState();
      final result =
          await fetchPatientUseCase(FetchPatientParams(pid: event.pid));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchSelectedPatientState(success),
      );
    } else if (event is CreatePatientEvent) {
      yield LoadingBeginState();
      final result = await createPatientUseCase(
          CreatePatientParams(patient: event.patient));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => CreatePatientState(success),
      );
    } else if (event is CreateContactDetailsEvent) {
      yield LoadingBeginState();
      final result = await createContactDeatilsUseCase(
          CreatePContactDetailsParams(contactDetails: event.contactDetails));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => CreateContactDetailsState(),
      );
    } else if (event is FetchEmergencyContactsEvent) {
      yield LoadingEmergencyContactsBeginState();
      final result = await fetchEmergencyContactsUseCase(
          FetchEmergencyContactsParams(pid: event.patientId));
      yield LoadingEmergencyContactsEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchEmergencyContactsState(success),
      );
    } else if (event is FetchInsuranceListEvent) {
      yield LoadingInsuranceListBeginState();
      final result = await fetchInsuranceListUseCase(
          FetchInsuranceListParams(pid: event.patientId));
      yield LoadingInsuranceListEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => FetchInsuranceListState(success),
      );
    } else if (event is SaveEmergencyContactsEvent) {
      yield LoadingEmergencyContactsBeginState();
      final result = await saveEmergencyContactsUseCase(
          SaveEmergencyContactsParams(
              emergencyContactList: event.emergencyContacts));
      yield LoadingEmergencyContactsEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => SaveEmergencyContactsState(),
      );
    } else if (event is SaveInsuranceListEvent) {
      yield LoadingInsuranceListBeginState();
      final result = await saveInsuranceListUseCase(
          SaveInsuranceListParams(insuranceList: event.insuranceList));
      yield LoadingInsuranceListEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => SaveInsuranceListState(),
      );
    } else if (event is EnableSaveInsuranceEvent) {
      bool status = !isBlank(event.insurance.insuranceProvider) &&
          !isBlank(event.insurance.policyNumber) &&
          (event.insurance.expirationDate != null);
      yield EnableSaveInsuranceState(
          status: status, insurance: event.insurance);
    } else if (event is EnableSaveEmergencyContactEvent) {
      bool status = !isBlank(event.emergencyContact.firstName) &&
          !isBlank(event.emergencyContact.lastName) &&
          !isBlank(event.emergencyContact.contactNumber);
      yield EnableSaveEmergencyContactState(
          status: status, emergencyContact: event.emergencyContact);
    } else if (event is UpdateInsuranceListEvent) {
      yield UpdateInsuranceListState(patient: event.patient);
    } else if (event is UpdateEmergencyContactListEvent) {
      yield UpdateEmergencyContactListState(patient: event.patient);
    } else if (event is UploadImageEvent) {
      yield UploadingImageBeginState();
      final result =
          await uploadImageUseCase(UploadImageParams(path: event.path));
      yield UploadingImageEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => ImageUploadedState(link: success),
      );
    } else if (event is ShowErrorMessageEvent) {
      yield ErrorState(event.message);
    }
  }
}
