import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/identity_child_widget.dart';

class GuardiansIdentityVerificationFormWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final bool isEdit;
  final Patient patient;
  final int selectedPatientRecord;
  final List<Gender> genderList;
  final List<IdType> idTypeList;
  final List<MaritalStatus> maritalStatusList;
  final List<LanguageValueSetList> languageList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;
  final List<MatchingPatient> matchingPatientRecords;
  @override
  _GuardiansIdentityVerificationFormWidgetState createState() =>
      _GuardiansIdentityVerificationFormWidgetState();
  GuardiansIdentityVerificationFormWidget(
      {this.selectedPatientRecord,
      this.matchingPatientRecords,
      this.bloc,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList,
      this.relationshipList,
      this.languageList,
      this.ownershipList,
      this.insuranceList,
      this.isEdit,
      this.patient});
}

class _GuardiansIdentityVerificationFormWidgetState
    extends State<GuardiansIdentityVerificationFormWidget> {
  bool isMatchingRecordsLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormView(
      header: "GUARDIAN'S IDENTITY VERIFICATION".toUpperCase(),
      subtitle:
          "You’re creating a minor under 18 years old. Please, provide their guardian’s ID and specify their relationship.",
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
            bloc: this.widget.bloc,
            builder: (context, state) {
              Patient pData = this.widget.patient;
              if (state is EnablePatientSaveState) {
                pData = state.patient;
              }
              return FieldAndLabel<DropdownMenuItem<String>>(
                isMandatory: false,
                fieldType: FieldType.DropDownList,
                // TODO: Fix opening the dropdown list
                listItems: ((widget?.relationshipList?.length ?? 0) > 0)
                    ? widget.relationshipList
                        .map((item) => DropdownMenuItem(
                            value: item?.id ?? '',
                            child: Text(item?.name ?? '')))
                        .toList()
                    : null,
                margin: EdgeInsets.all(0),
                fieldValue: !isBlank(pData?.guardianIdenitification?.relationId)
                    ? ((widget.relationshipList?.where((val) {
                                  return val?.id ==
                                          pData?.guardianIdenitification
                                              ?.relationId ??
                                      "";
                                })?.toList())
                                    ?.length ??
                                0) >
                            0
                        ? (widget?.relationshipList?.where((val) {
                            return val?.id ==
                                    pData
                                        ?.guardianIdenitification?.relationId ??
                                "";
                          })?.toList())
                            ?.first
                            ?.id
                        : null
                    : null,
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.guardianIdenitification.relationId = value;
                  widget.bloc
                      .add(EnablePatientSaveEvent(patient: widget.patient));
                },
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                fieldTextColor: regularTextColor,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "GUARDIAN'S RELATIONSHIP".toUpperCase(),
                placeholder: "Select relationship",
                axis: Axis.vertical,
                enabled: true,
                wrapWithRow: true,
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
            fieldValue:
                widget?.patient?.guardianIdenitification?.firstName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "FIRST NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.guardianIdenitification.firstName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter first name",
            axis: Axis.vertical,
            enabled: true,
          ),
          Space(
            vertical: 26,
          ),
          FieldAndLabel(
            isMandatory: false,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            fieldBackgroundColor: textFieldBGcolor,
            fieldTextColor: textInputColor,
            maxLength: 50,
            fieldValue:
                widget?.patient?.guardianIdenitification?.middleName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "MIDDLE NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.guardianIdenitification.middleName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter middle name (Optional)",
            axis: Axis.vertical,
            enabled: true,
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
            fieldValue:
                widget?.patient?.guardianIdenitification?.lastName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "LAST NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.guardianIdenitification.lastName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter last name",
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
                lastDate: DateTime.now().subtract(Duration(days: 365 * 18 + 1)),
                fieldValue: pData?.guardianIdenitification?.birthDate,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "DATE OF BIRTH",
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.guardianIdenitification.birthDate = value;
                  widget.bloc
                      .add(EnablePatientSaveEvent(patient: widget.patient));
                },
                validationMessage: "",
                placeholder: "Select date of birth",
                axis: Axis.vertical,
                enabled: true,
              );
            },
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
                fieldValue: pData?.guardianIdenitification?.gender,
                tagsItems: ((widget?.genderList?.length ?? 0) > 0)
                    ? widget.genderList
                        .map((item) => ValueDisplayPair(
                            value: item?.id ?? '',
                            label: item?.gender?.trim() ?? ''))
                        .toList()
                    : null,
                fieldTextColor: textInputColor,
                fieldType: FieldType.SingleTagPicker,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "GENDER".toUpperCase(),
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.guardianIdenitification.gender = value;
                  widget.bloc
                      .add(EnablePatientSaveEvent(patient: widget.patient));
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
          IdentityChildWidget(
            isGuardian: true,
            patient: widget.patient,
            isEdit: widget.isEdit,
            bloc: widget.bloc,
            selectedPatientRecord: widget.selectedPatientRecord,
            matchingPatientRecords: widget.matchingPatientRecords,
            languageList: widget.languageList,
            maritalStatusList: widget.maritalStatusList,
            genderList: widget.genderList,
            relationshipList: widget.relationshipList,
            ownershipList: widget.ownershipList,
            insuranceList: widget.insuranceList,
            idTypeList: widget.idTypeList,
          )
        ],
      ),
    );
  }
}
