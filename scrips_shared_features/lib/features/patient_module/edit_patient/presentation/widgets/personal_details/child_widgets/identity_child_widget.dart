import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/constants/app_constants.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/patient_selection_widget.dart';

class IdentityChildWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final bool isGuardian;
  final bool isEdit;
  final Patient patient;
  final int selectedPatientRecord;
  final List<Gender> genderList;
  final List<IdType> idTypeList;
  final List<MaritalStatus> maritalStatusList;
  final List<Language> languageList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;
  final List<MatchingPatient> matchingPatientRecords;

  @override
  _IdentityChildWidgetState createState() => _IdentityChildWidgetState();
  IdentityChildWidget(
      {this.selectedPatientRecord,
      this.matchingPatientRecords,
      this.isGuardian = false,
      this.bloc,
      this.patient,
      this.isEdit,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList,
      this.relationshipList,
      this.languageList,
      this.ownershipList,
      this.insuranceList});
}

class _IdentityChildWidgetState extends State<IdentityChildWidget> {
  bool isMatchingRecordsLoading = false;
  Timer _debounce;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void fetchMatchingRecord({String idType, String idNumber}) {
    if (widget.patient.isAdult == true) {
      widget.bloc.dispatch(
          FetchMatchingRecordsEvent(idType: idType, idNumber: idNumber));
    } else {
      widget.bloc.dispatch(FetchMatchingRecordsEvent(
          firstName: widget.patient.firstName,
          lastName: widget.patient.lastName,
          birthDate: widget.patient.birthDate,
          gender: widget.patient.gender,
          idType: idType,
          idNumber: idNumber));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
          bloc: this.widget.bloc,
          builder: (context, state) {
            Patient pData = this.widget.patient;
            if (state is EnablePatientSaveState) {
              pData = state.patient;
            }
            return FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldValue: (widget.isGuardian)
                  ? pData?.guardianIdenitification?.idType ?? null
                  : pData?.identification?.idType ?? null,
              tagsItems: ((widget?.idTypeList?.length ?? 0) > 0)
                  ? widget.idTypeList
                      .map((item) => ValueDisplayPair(
                          item?.id ?? '', item?.name?.trim() ?? ''))
                      .toList()
                  : null,
              fieldTextColor: textInputColor,
              fieldType: FieldType.SingleTagPicker,
              labelTextStyle: defaultFieldLabelStyle(null, null),
              labelValue: "ID TYPE".toUpperCase(),
              onChanged: (value, FieldAndLabelState state) {
                if (widget.isGuardian) {
                  widget.patient.guardianIdenitification.idType = value;
                } else {
                  widget.patient.identification.idType = value;
                }
                widget.bloc
                    .dispatch(EnablePatientSaveEvent(patient: widget.patient));
                if (_debounce?.isActive ?? false) _debounce.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () async {
                  fetchMatchingRecord(
                      idType: value,
                      idNumber: (widget.isGuardian)
                          ? widget?.patient?.guardianIdenitification
                                  ?.idNumber ??
                              ""
                          : widget?.patient?.identification?.idNumber ?? "");
                });
              },
              validationMessage: "",
              axis: Axis.vertical,
              enabled: true,
            );
          },
        ),
        Space(
          vertical: 26,
        ),
        FieldAndLabel(
          isMandatory: true,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          fieldBackgroundColor: textFieldBGcolor,
          fieldTextColor: textInputColor,
          maxLength: 50,
          fieldValue: (widget.isGuardian)
              ? widget?.patient?.guardianIdenitification?.idNumber ?? ""
              : widget?.patient?.identification?.idNumber ?? "",
          fieldType: FieldType.TextField,
          labelTextStyle: defaultFieldLabelStyle(null, null),
          labelValue: "ID NUMBER".toUpperCase(),
          onChanged: (value, FieldAndLabelState state) {
            if (widget.isGuardian) {
              widget.patient.guardianIdenitification.idNumber = value;
            } else {
              widget.patient.identification.idNumber = value;
            }
            widget.bloc
                .dispatch(EnablePatientSaveEvent(patient: widget.patient));
            if (_debounce?.isActive ?? false) _debounce.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () async {
              fetchMatchingRecord(
                  idType: (widget.isGuardian)
                      ? widget?.patient?.guardianIdenitification?.idType ?? ""
                      : widget?.patient?.identification?.idType ?? "",
                  idNumber: value);
            });
          },
          validationMessage: ((widget?.matchingPatientRecords?.length ?? 0) > 0)
              ? "This ID number already exists in the database. Please, double-check."
              : "",
          placeholder: "Enter ID number",
          axis: Axis.vertical,
          enabled: true,
        ),
        Space(
          vertical: 26,
        ),
        BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
          bloc: this.widget.bloc,
          builder: (context, state) {
            Patient pData = this.widget.patient;
            if (state is EnablePatientSaveState) {
              pData = state.patient;
            }
            return FieldAndLabel(
              isMandatory: true,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              fieldBackgroundColor: textFieldBGcolor,
              fieldTextColor: textInputColor,
              fieldType: FieldType.DatePicker,
              icon: Images.instance.licenseExpirationDate(),
              rightIcon: Images.instance.dropDownIcon(),
              fieldValue: (widget.isGuardian)
                  ? pData?.guardianIdenitification?.idExpirationDate ?? null
                  : pData?.identification?.idExpirationDate ?? null,
              labelTextStyle: defaultFieldLabelStyle(null, null),
              firstDate: DateTime.now(),
              labelValue: "ID EXPIRATION DATE",
              onChanged: (value, FieldAndLabelState state) {
                if (widget.isGuardian) {
                  widget.patient.guardianIdenitification.idExpirationDate =
                      value;
                } else {
                  widget.patient.identification.idExpirationDate = value;
                }
                widget.bloc
                    .dispatch(EnablePatientSaveEvent(patient: widget.patient));
                if (_debounce?.isActive ?? false) _debounce.cancel();
                _debounce = Timer(const Duration(milliseconds: 500), () async {
                  fetchMatchingRecord(
                      idType: (widget.isGuardian)
                          ? widget?.patient?.guardianIdenitification?.idType ??
                              ""
                          : widget?.patient?.identification?.idType ?? "",
                      idNumber: (widget.isGuardian)
                          ? widget?.patient?.guardianIdenitification
                                  ?.idNumber ??
                              ""
                          : widget?.patient?.identification?.idNumber ?? "");
                });
              },
              validationMessage: ((widget?.matchingPatientRecords?.length ??
                          0) >
                      0)
                  ? ((currentAppType == AppType.UK)
                      ? "There ${(widget?.matchingPatientRecords?.length ?? 0) == 1 ? "is" : "are"} ${(widget?.matchingPatientRecords?.length ?? 0)} similar record in the database. Please, proceed to the reception"
                      : "There ${(widget?.matchingPatientRecords?.length ?? 0) == 1 ? "is" : "are"} ${(widget?.matchingPatientRecords?.length ?? 0)} similar record in the database. Please, click on the record found to explore and make sure you’re not creating a duplicate.")
                  : "",
              placeholder: "Select expiration date",
              axis: Axis.vertical,
              enabled: true,
            );
          },
        ),
        BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
          bloc: this.widget.bloc,
          builder: (context, state) {
            if (state is LoadingMatchingRecordsBeginState) {
              isMatchingRecordsLoading = true;
            } else if (state is LoadingMatchingRecordsEndState) {
              isMatchingRecordsLoading = false;
            } else if (state is FetchMatchingRecordsState) {
              isMatchingRecordsLoading = false;
            }
            return Column(
              children: <Widget>[
                Space(
                  vertical: 26,
                ),
                (isMatchingRecordsLoading)
                    ? Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 16),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        enabledBtnBGColor),
                                  )),
                              Space(
                                horizontal: 20,
                              ),
                              Text("validating patient identity",
                                  style: semiBoldLabelTextStyle(
                                      14, regularTextColor)),
                            ],
                          )),
                        ),
                      )
                    : ((widget?.matchingPatientRecords?.length ?? 0) > 0 &&
                            (currentAppType != AppType.UK))
                        ? PatientSelectionWidget(
                            patientRecords: widget.matchingPatientRecords,
                            bloc: widget.bloc,
                            languageList: widget.languageList,
                            maritalStatusList: widget.maritalStatusList,
                            genderList: widget.genderList,
                            relationshipList: widget.relationshipList,
                            ownershipList: widget.ownershipList,
                            insuranceList: widget.insuranceList,
                            idTypeList: widget.idTypeList,
                            selectedPatientRecord: widget.selectedPatientRecord,
                          )
                        : Container(),
              ],
            );
          },
        ),
      ],
    );
  }
}
