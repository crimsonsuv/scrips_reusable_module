import 'dart:async';

import 'package:after_init/after_init.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/alert_dialog.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
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
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/contact_details_widget.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/personal_details/personal_details_widget.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

class CreatePatientScreen extends StatefulWidget {
  final PatientDatum pData;
  final Function doPop;
  final String orgId;
  final String practiceId;

  @override
  _CreatePatientScreen createState() => _CreatePatientScreen();

  // passing argument for possible edit ?
  CreatePatientScreen({this.pData, this.doPop, this.orgId, this.practiceId});
}

class _CreatePatientScreen extends State<CreatePatientScreen>
    with AfterInitMixin<CreatePatientScreen> {
//  bool needsRefresh = false;
  final bloc = sl<CreateEditPatientBloc>();
  bool isEdit = false;
  int selectedTab = 0;
  bool isSaveEnabled = false;
  bool isLoading = false;
  bool isDropDownLoading = false;
  bool validationErrorStatus = false;
  List<Gender> genderList;
  List<IdType> idTypeList;
  List<MaritalStatus> maritalStatusList;
  List<LanguageValueSetList> languageList;
  List<Relationship> relationshipList;
  List<Ownership> ownershipList;
  List<Insurance> insuranceList;
  Patient patient;
  String initialIdNumber;
  String initialIdType;
  List<MatchingPatient> matchingPatientRecords;
  bool isInitial = true;
  bool isDataUpdated = false;

  @override
  void initState() {
    super.initState();
    isEdit = widget.pData != null;
    if (widget.pData != null) {
      bloc.dispatch(FetchPatientEvent(pid: widget.pData.patientId));
    } else {
      patient = Patient(
          isAdult: true,
          practiceId: widget.practiceId,
          organizationId: widget.orgId,
          updatePatientContactRequest: UpdatePatientContactRequest(),
          emergencyContactResponse: [],
          healthInsuranceResponse: [],
          identification: Identification(),
          guardianIdenitification: GuardianIdenitification());
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  void didInitState() {
    bloc.dispatch(FetchGendersEvent());
    bloc.dispatch(FetchIdTypeEvent());
    bloc.dispatch(FetchLanguageEvent());
    bloc.dispatch(FetchMaritalStatusEvent());
    bloc.dispatch(FetchRelationshipEvent());
    bloc.dispatch(FetchOwnershipEvent());
    bloc.dispatch(FetchInsuranceEvent());
  }

  void cancelCreatingDialog() {
    confirmDialog(
        context: context,
        title: "Do you really want to cancel?",
        message:
            "Your progress will be discarded and the changes will not be saved.",
        isRemove: true,
        onYes: () {
          widget.doPop();
        });
  }

  void cancelContactCreatingDialog() {
    confirmDialog(
        context: context,
        title: "Do you really want to cancel creating address details?",
        message:
            "We have created the patient, you can edit the contact details later.",
        isRemove: true,
        onYes: () {
          widget.doPop();
        });
  }

  void doCancel() {
    if (isDataUpdated) {
      if (isEdit) {
        cancelCreatingDialog();
      } else if (!isEdit && patient.patientId != null) {
        cancelContactCreatingDialog();
      } else if (!isEdit && patient.patientId == null) {
        cancelCreatingDialog();
      } else {
        widget.doPop();
      }
    } else {
      widget.doPop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is SelectedTabState) {
              selectedTab = state.index;
            } else if (state is ErrorState) {
              showToastWidget(
                ToastWidget(
                  message: state.message,
                  backgroundColor: red,
                ),
                position: ToastPosition.top,
                context: context,
                duration: Duration(seconds: 4),
              );
            } else if (state is FetchGendersState) {
              genderList = state.genderList;
            } else if (state is FetchIdTypeState) {
              idTypeList = state.idTypeList;
            } else if (state is FetchLanguageState) {
              languageList = state.languageList;
            } else if (state is FetchMaritalStatusState) {
              maritalStatusList = state.maritalList;
            } else if (state is FetchRelationshipState) {
              relationshipList = state.relationshipList;
            } else if (state is FetchOwnershipState) {
              ownershipList = state.ownershipList;
            } else if (state is FetchPatientState) {
              patient = state.patient;
              patient.updatePatientContactRequest.patientId = patient.patientId;
              initialIdNumber = patient.identification.idNumber;
              initialIdType = patient.identification.idType;
              if (!isInitial) {
                bloc.dispatch(FetchMatchingRecordsEvent(
                    idNumber: initialIdNumber, idType: initialIdType));
              }
              isInitial = false;
              isEdit = true;
              if ((matchingPatientRecords?.length ?? 0) > 0) {
                matchingPatientRecords.clear();
              }
            } else if (state is LoadingDropDownBeginState) {
              isDropDownLoading = true;
            } else if (state is LoadingDropDownEndState) {
              isDropDownLoading = false;
            } else if (state is LoadingBeginState) {
              isLoading = true;
            } else if (state is LoadingEndState) {
              isLoading = false;
            } else if (state is FetchInsuranceState) {
              insuranceList = state.insuranceList;
            } else if (state is EnablePatientSaveState) {
              patient = state.patient;
              isSaveEnabled = state.status;
              isDataUpdated = true;
            } else if (state is UpdatePatientSuccessState) {
              widget.doPop();
            } else if (state is FetchMatchingRecordsState) {
              state.matchingRecords
                  .removeWhere((data) => data.idNumber == initialIdNumber);
              matchingPatientRecords = state.matchingRecords;
              Timer(Duration(seconds: 3), () {
                bloc.dispatch(EnablePatientSaveEvent(
                    patient: patient,
                    matchingRecordCount: matchingPatientRecords.length));
              });
            } else if (state is UseRecordAnywayState) {
              matchingPatientRecords.clear();
              bloc.dispatch(EnablePatientSaveEvent(
                  patient: patient,
                  matchingRecordCount: matchingPatientRecords.length));
            } else if (state is UpdateInsuranceListState ||
                state is UpdateEmergencyContactListState) {
              Timer(Duration(seconds: 2), () {
                bloc.dispatch(EnablePatientSaveEvent(
                    patient: patient,
                    matchingRecordCount: matchingPatientRecords?.length ?? 0));
              });
            } else if (state is CreatePatientState) {
              patient.patientId = state.response.patientId;
              patient.patientMrn = state.response.patientMrn;
              patient.lastUpdated = state.response.lastUpdated;
              patient.isActive = state.response.status;
              patient.updatePatientContactRequest.patientId =
                  state.response.patientId;
              bloc.dispatch(EnablePatientSaveEvent(
                  patient: patient,
                  matchingRecordCount: matchingPatientRecords?.length ?? 0));
              bloc.dispatch(ChangeTabIndexEvent(1));
            } else if (state is CreateContactDetailsState) {
              showToastWidget(
                  ToastWidget(
                    message: "Successfully Added ${patient.firstName}",
                    backgroundColor: Colors.black87,
                  ),
                  position: ToastPosition.top,
                  context: context,
                  duration: Duration(seconds: 3), onDismiss: () {
                widget.doPop();
              });
            }
          },
          child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
            bloc: bloc,
            condition: (preSate, currSate) {
              if (currSate is EnablePatientSaveState ||
                  currSate is LoadingMatchingRecordsBeginState ||
                  currSate is LoadingMatchingRecordsEndState ||
                  currSate is EnableSaveInsuranceState ||
                  currSate is EnableSaveEmergencyContactState ||
                  currSate is UploadingImageBeginState ||
                  currSate is UploadingImageEndState) {
                if (currSate is LoadingMatchingRecordsEndState) {
                  if ((matchingPatientRecords?.length ?? 0) > 0) {
                    matchingPatientRecords.clear();
                    return true;
                  }
                }
                return false;
              }
              return true;
            },
            builder: (context, state) {
              return body(context);
            },
          )),
    );
  }

//  void updateOrg() {
//    if (selectedCountry != null || selectedCountry != "") {
//      if (editedOrgData.contactDetails.country != selectedCountry) {
//        bloc.dispatch(ShowErrorEvent(
//            "Contact Address outside $selectedCountry not allowed, Please contact Scrips to change country."));
//        return;
//      } else {
//        bloc.dispatch(UpdateEvent(organization: editedOrgData));
//      }
//    } else {
//      bloc.dispatch(UpdateEvent(organization: editedOrgData));
//    }
//  }

  Widget body(BuildContext context) {
    print("REBUILD HAPPENED");
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  //height: 118,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 29, left: 24),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Patients".toUpperCase(),
                                    style: boldLabelTextStyle(
                                        12.0, labelTextStyleTextColor),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Images.instance.breadCrumbNext(),
                                  ),
                                  Text(
                                    (isEdit)
                                        ? "Edit Patient".toUpperCase()
                                        : "Add New Patient".toUpperCase(),
                                    style: boldLabelTextStyle(
                                        12.0, labelTextStyleTextColor),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 19, left: 16, bottom: 16),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        doCancel();
                                      },
                                      child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          child: Center(
                                              child: Images.instance.back(
                                                  height: 24, width: 24))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              color: bgColor,
                                              child: (!isEdit ||
                                                      patient?.photoUrl == "" ||
                                                      patient?.photoUrl == null)
                                                  ? Images.instance.userpic()
                                                  : Image.network(
                                                      patientsServer +
                                                          patient.photoUrl,
                                                      fit: BoxFit.fill,
                                                    ),
                                            ),
                                          ),
                                          Space(
                                            horizontal: 16,
                                          ),
                                          BlocBuilder<CreateEditPatientBloc,
                                              CreateEditPatientState>(
                                            bloc: bloc,
                                            builder: (context, state) {
                                              Patient pData = patient;
                                              String name = ((patient
                                                              ?.firstName ??
                                                          "") !=
                                                      "")
                                                  ? "${pData?.firstName ?? ""}${((pData?.middleName ?? "") == "") ? " " : (" " + (pData?.middleName ?? "") + " ")}${pData?.lastName ?? ""}"
                                                  : widget?.pData?.name ?? "";
                                              if (state
                                                  is EnablePatientSaveState) {
                                                pData = state.patient;
                                                name =
                                                    "${pData?.firstName ?? ""}${((pData?.middleName ?? "") == "") ? " " : (" " + (pData?.middleName ?? "") + " ")}${pData?.lastName ?? ""}";
                                              }
                                              return Text(
                                                isEdit
                                                    ? name
                                                    : "Add New Patient",
                                                style: boldLabelTextStyle(
                                                    26.0, textInputColor),
                                                maxLines: null,
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            //
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: BlocBuilder<CreateEditPatientBloc,
                              CreateEditPatientState>(
                            bloc: bloc,
                            builder: (context, state) {
                              return Container(
                                child: Row(
                                  children: <Widget>[
                                    Button(
                                      buttonBackgroundColor: (isSaveEnabled)
                                          ? normalBtnTextColor
                                          : disabledBtnBGColor,
                                      isLoading: isLoading,
                                      onPressed: () async {
                                        if (isEdit && isSaveEnabled) {
                                          if ((patient?.healthInsuranceResponse
                                                      ?.length ??
                                                  0) >
                                              1) {
                                            if (patient
                                                    .healthInsuranceResponse[0]
                                                    .policyNumber ==
                                                patient
                                                    .healthInsuranceResponse[1]
                                                    .policyNumber) {
                                              bloc.dispatch(ShowErrorMessageEvent(
                                                  message:
                                                      "Health Insurance already added"));
                                              return;
                                            }
                                          }
                                          bloc.dispatch(UpdatePatientEvent(
                                              patient: patient,
                                              pid: patient.patientId));
                                        } else if ((!isEdit) &&
                                            (selectedTab == 0) &&
                                            isSaveEnabled) {
                                          bloc.dispatch(CreatePatientEvent(
                                            patient: patient,
                                          ));
                                        } else if ((!isEdit) &&
                                            (selectedTab == 1) &&
                                            isSaveEnabled) {
                                          bloc.dispatch(
                                              CreateContactDetailsEvent(
                                            patient: patient,
                                          ));
                                        }
                                      },
                                      text: ((isEdit || (selectedTab == 1))
                                          ? S.of(context).save
                                          : "Next"),
                                      style: semiBoldLabelTextStyle(
                                          15.0,
                                          (isSaveEnabled)
                                              ? bgColor
                                              : enabledBtnTextColor),
                                      height: 32,
                                      width: 70,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
                Container(height: 1.0, color: separatorColor),
                Container(
                  alignment: Alignment.centerLeft,
                  height: 48.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: <Widget>[
                        FlatButton(
                          onPressed: (isEdit)
                              ? () {
                                  bloc.dispatch(ChangeTabIndexEvent(0));
                                }
                              : null,
                          child: Text(
                            "Personal Details",
                            style: semiBoldLabelTextStyle(
                                15.0,
                                (selectedTab == 0)
                                    ? normalBtnTextColor
                                    : disabledTabTextColor),
                          ),
                        ),
                        FlatButton(
                          onPressed: (isEdit)
                              ? () {
                                  bloc.dispatch(ChangeTabIndexEvent(1));
                                }
                              : null,
                          child: Text(
                            "Contact Details",
                            style: semiBoldLabelTextStyle(
                                15.0,
                                (selectedTab == 1)
                                    ? normalBtnTextColor
                                    : disabledTabTextColor),
                          ),
                        ),
                        FlatButton(
                          onPressed: (isEdit)
                              ? () {
                                  bloc.dispatch(ChangeTabIndexEvent(2));
                                }
                              : null,
                          child: Text(
                            "EMR",
                            style: semiBoldLabelTextStyle(
                                15.0,
                                (selectedTab == 2)
                                    ? normalBtnTextColor
                                    : disabledTabTextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1.0, color: separatorColor),
          Expanded(
            child: Container(
              color: mainContainedAreaBackgroundColor,
              child: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: (MediaQuery.of(context).orientation ==
                                      Orientation.portrait &&
                                  !kIsWeb)
                              ? MediaQuery.of(context).size.width
                              : internalMaxWidth(context, false)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BlocBuilder<CreateEditPatientBloc,
                              CreateEditPatientState>(
                            bloc: bloc,
                            builder: (context, state) {
                              return Container(
                                  margin: EdgeInsets.only(
                                      left: 32, top: 34, bottom: 32),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text("PATIENT MRN: ".toUpperCase(),
                                              style: boldLabelTextStyle(12.0,
                                                  labelTextStyleTextColor)),
                                          Text(
                                              '${patient?.patientMrn ?? "N/A"}',
                                              style: normalLabelTextStyle(
                                                  13.0, regularTextColor)),
                                          Space(
                                            horizontal: 22,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Language: ".toUpperCase(),
                                              style: boldLabelTextStyle(12.0,
                                                  labelTextStyleTextColor)),
                                          ConstrainedBox(
                                            constraints:
                                                BoxConstraints(maxWidth: 120),
                                            child: Tooltip(
                                              message:
                                                  '${((patient?.language ?? "") != "") ? ((languageList?.where((data) => data.languageId == patient?.language)?.toList()?.length ?? 0) > 0) ? languageList?.where((data) => data.languageId == patient?.language)?.toList()?.elementAt(0)?.code?.displayName?.trim() ?? "N/A" : "N/A" : "N/A"}',
                                              child: Text(
                                                '${((patient?.language ?? "") != "") ? ((languageList?.where((data) => data.languageId == patient?.language)?.toList()?.length ?? 0) > 0) ? languageList?.where((data) => data.languageId == patient?.language)?.toList()?.elementAt(0)?.code?.displayName?.trim() ?? "N/A" : "N/A" : "N/A"}',
                                                style: normalLabelTextStyle(
                                                    13.0, regularTextColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Space(
                                            horizontal: 22,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Last Update: ".toUpperCase(),
                                              style: boldLabelTextStyle(12.0,
                                                  labelTextStyleTextColor)),
                                          Text(
                                              '${((patient?.lastUpdated ?? null) == null) ? "N/A" : scDateFormat(patient.lastUpdated)}',
                                              style: normalLabelTextStyle(
                                                  13.0, regularTextColor)),
                                          Space(
                                            horizontal: 22,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Status: ".toUpperCase(),
                                              style: boldLabelTextStyle(12.0,
                                                  labelTextStyleTextColor)),
                                          Text(
                                              '${(patient?.isActive == null) ? "N/A" : ((patient?.isActive ?? false) ? "Active" : "Inactive")}',
                                              style: normalLabelTextStyle(
                                                  13.0, regularTextColor)),
                                        ],
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          Container(
                              //height: MediaQuery.of(context).size.height - headerHeight,
                              decoration: new BoxDecoration(
                                  // TODO: fix this color issue, where is that color set?
                                  ),
                              child: SizedBox.fromSize(
                                  child: Column(
                                children: <Widget>[
                                  isDropDownLoading
                                      ? Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 16, bottom: 16),
                                            child: Center(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              enabledBtnBGColor),
                                                    )),
                                                Space(
                                                  horizontal: 20,
                                                ),
                                                Text(
                                                    "Please wait, fetching data..",
                                                    style:
                                                        semiBoldLabelTextStyle(
                                                            14,
                                                            regularTextColor)),
                                              ],
                                            )),
                                          ),
                                        )
                                      : Container(),
                                  selectedTabWidget(selectedTab),
                                ],
                              ))),
                        ],
                      ),
                    ),
                    //Expanded(child: Container(),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectedTabWidget(index) {
    switch (index) {
      case 0:
        return PersonalDetailsWidget(
          insuranceList: insuranceList,
          ownershipList: ownershipList,
          bloc: bloc,
          isEdit: isEdit,
          patient: patient,
          maritalStatusList: maritalStatusList,
          genderList: genderList,
          languageList: languageList,
          idTypeList: idTypeList,
          relationshipList: relationshipList,
          initialIdNumber: initialIdNumber,
          matchingPatientRecords: matchingPatientRecords,
        );
        break;
      case 1:
        return ContactDetailsWidget(
          bloc: bloc,
          isEdit: isEdit,
          patient: patient,
          ownershipList: ownershipList,
          relationshipList: relationshipList,
          insuranceList: insuranceList,
        );
        break;
      case 2:
        return Container(
          color: Colors.blue,
          height: 900,
        );
        break;
      default:
        return Container();
    }
  }
}
