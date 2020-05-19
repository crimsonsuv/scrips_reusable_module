import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/resizable_cupertino_switch_widget.dart';
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
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/guardians_identity_verification.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/identity_verification_form.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/child_widgets/personal_details_form.dart';

class PersonalDetailsWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Gender> genderList;
  final List<MaritalStatus> maritalStatusList;
  final List<LanguageValueSetList> languageList;
  final List<IdType> idTypeList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;
  final String initialIdNumber;
  final List<MatchingPatient> matchingPatientRecords;
  @override
  _PersonalDetailsWidgetState createState() => _PersonalDetailsWidgetState();
  PersonalDetailsWidget(
      {this.bloc,
      this.isEdit,
      this.initialIdNumber,
      this.matchingPatientRecords,
      this.patient,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList,
      this.relationshipList,
      this.languageList,
      this.ownershipList,
      this.insuranceList});
}

class _PersonalDetailsWidgetState extends State<PersonalDetailsWidget> {
  bool isMinor = false;
  int selectedPatientRecord = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isMinor = !(widget?.patient?.isAdult ?? true);

    return IntrinsicHeight(
      child: OKToast(
        child: BlocListener(
            bloc: widget.bloc,
            listener: (BuildContext context, state) {
              if (state is SelectedPatientTypeState) {
                isMinor = state.isMinor;
                widget.patient.isAdult = !isMinor;
                widget.bloc
                    .dispatch(EnablePatientSaveEvent(patient: widget.patient));
              } else if (state is SelectedPatientRecord) {
                selectedPatientRecord = state.index;
              }
            },
            child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
              bloc: widget.bloc,
              condition: (preSate, currSate) {
                if (currSate is EnablePatientSaveState ||
                    currSate is LoadingMatchingRecordsBeginState ||
                    currSate is LoadingMatchingRecordsEndState) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                return body(context);
              },
            )),
      ),
    );
  }

  Widget body(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            (widget.isEdit)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "PATIENT STATUS".toUpperCase(),
                        style: boldLabelTextStyle(12, textInputColor),
                      ),
                      Space(
                        vertical: 12,
                      ),
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: enabledBtnTextColor,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Set patient active",
                                style:
                                    normalLabelTextStyle(17, regularTextColor),
                              ),
                              BlocBuilder<CreateEditPatientBloc,
                                  CreateEditPatientState>(
                                bloc: this.widget.bloc,
                                builder: (context, state) {
                                  Patient pData = this.widget.patient;
                                  if (state is EnablePatientSaveState) {
                                    pData = state.patient;
                                  }
                                  return SizedCupertinoSwitch(
                                    width: 51,
                                    height: 31,
                                    value: pData?.isActive ?? false,
                                    onChanged: (status) {
                                      widget.patient.isActive = status;
                                      widget.bloc.dispatch(
                                          EnablePatientSaveEvent(
                                              patient: widget.patient));
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Space(
                        vertical: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 20),
                        child: Text(
                          "Enabling ‘Set patient active’ will make the patient’s record active. We recommend to keep the patient’s record active at all times unless the patient hasn’t showed up for a long time or is deceased.",
                          style: semiBoldLabelTextStyle(
                              13, labelTextStyleTextColor),
                        ),
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "I AM ADDING".toUpperCase(),
                        style: boldLabelTextStyle(12, textInputColor),
                      ),
                      Space(
                        vertical: 12,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              widget.bloc
                                  .dispatch(ChangePatientTypeEvent(true));
                            },
                            child: Container(
                              height: 48,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: (isMinor)
                                      ? Border.all(
                                          color: enabledBtnBGColor, width: 2)
                                      : null,
                                  color: enabledBtnTextColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 11),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "MINOR",
                                          style: boldLabelTextStyle(
                                              12, labelTextStyleTextColor),
                                        ),
                                        Text(
                                          "0-18 years old",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        color: bgColor,
                                        child: Images.instance.minorIcon(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Space(
                            horizontal: 16,
                          ),
                          InkWell(
                            onTap: () {
                              widget.bloc
                                  .dispatch(ChangePatientTypeEvent(false));
                            },
                            child: Container(
                              height: 48,
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border: (isMinor)
                                      ? null
                                      : Border.all(
                                          color: enabledBtnBGColor, width: 2),
                                  color: enabledBtnTextColor),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 11),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "ADULT",
                                          style: boldLabelTextStyle(
                                              12, labelTextStyleTextColor),
                                        ),
                                        Text(
                                          ">18 years old",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(32),
                                      child: Container(
                                        height: 32,
                                        width: 32,
                                        color: bgColor,
                                        child: Images.instance.userpic(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Space(
                        vertical: 16,
                      ),
                      Text(
                        "Selecting a patient type will define the future worfklow.",
                        style:
                            semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                      )
                    ],
                  ),
            Space(
              vertical: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "ID CARD".toUpperCase(),
                  style: boldLabelTextStyle(12, textInputColor),
                ),
                Space(
                  vertical: 12,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 104,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: enabledBtnTextColor),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Images.instance.cameraIcon(
                                height: 34, width: 43, fit: BoxFit.cover),
                            Space(
                              vertical: 13,
                            ),
                            Text(
                              "Scan front side of ID",
                              style: normalLabelTextStyle(
                                  13, defaultFieldHintColor),
                            )
                          ],
                        ),
                      ),
                    ),
                    Space(
                      horizontal: 16,
                    ),
                    Container(
                      height: 104,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: enabledBtnTextColor),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Images.instance.cameraIcon(
                                height: 34, width: 43, fit: BoxFit.cover),
                            Space(
                              vertical: 13,
                            ),
                            Text(
                              "Scan back side of ID",
                              style: normalLabelTextStyle(
                                  13, defaultFieldHintColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Space(
                  vertical: 16,
                ),
                Text(
                  "Start with scanning the patient’s ID card.",
                  style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                )
              ],
            ),
            Space(
              vertical: 24,
            ),
            PersonalDetailsFormWidget(
              isEdit: widget.isEdit,
              bloc: widget.bloc,
              patient: widget.patient,
              languageList: widget.languageList,
              genderList: widget.genderList,
              maritalStatusList: widget.maritalStatusList,
            ),
            Space(
              vertical: 24,
            ),
            (isMinor)
                ? GuardiansIdentityVerificationFormWidget(
                    bloc: widget.bloc,
                    selectedPatientRecord: selectedPatientRecord,
                    patient: widget.patient,
                    isEdit: widget.isEdit,
                    languageList: widget.languageList,
                    maritalStatusList: widget.maritalStatusList,
                    genderList: widget.genderList,
                    relationshipList: widget.relationshipList,
                    ownershipList: widget.ownershipList,
                    insuranceList: widget.insuranceList,
                    idTypeList: widget.idTypeList,
                    matchingPatientRecords: widget.matchingPatientRecords,
                  )
                : IdentityVerificationFormWidget(
                    patient: widget.patient,
                    isEdit: widget.isEdit,
                    bloc: widget.bloc,
                    selectedPatientRecord: selectedPatientRecord,
                    matchingPatientRecords: widget.matchingPatientRecords,
                    languageList: widget.languageList,
                    maritalStatusList: widget.maritalStatusList,
                    genderList: widget.genderList,
                    relationshipList: widget.relationshipList,
                    ownershipList: widget.ownershipList,
                    insuranceList: widget.insuranceList,
                    idTypeList: widget.idTypeList,
                  ),
            Space(
              vertical: 50,
            ),
          ],
        ),
      ),
    );
  }
}
