import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/table_list_widget.dart';
import 'package:scrips_core/widgets/sliding_popup/show_sliding_popup.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/data/datamodels/matching_patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/presentation/widgets/personal_details/child_widgets/view_patient_popup.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/pages/patient_list_screen.dart';

class PatientSelectionWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final List<MatchingPatient> patientRecords;
  final List<Gender> genderList;
  final List<IdType> idTypeList;
  final List<MaritalStatus> maritalStatusList;
  final List<Language> languageList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;
  final int selectedPatientRecord;
  @override
  _PatientSelectionWidgetState createState() => _PatientSelectionWidgetState();
  PatientSelectionWidget(
      {this.selectedPatientRecord,
      this.bloc,
      this.patientRecords,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList,
      this.relationshipList,
      this.languageList,
      this.ownershipList,
      this.insuranceList});
}

class _PatientSelectionWidgetState extends State<PatientSelectionWidget> {
  List<TableListTitle> headerItemRowData = [];
  List<List<String>> rowItemDataList = [];
  sortType currentSortType = sortType.asc;
  TableListTitle selectedHeader;
  bool isPopupLoading = false;
  Patient selectedPatientData;
  String selectedPatientId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    headerItemRowData.add(TableListTitle(title: "Name", width: 130));
    headerItemRowData.add(TableListTitle(title: "Date Of Birth", width: 126));
    headerItemRowData.add(TableListTitle(title: "ID Type", width: 100));
    headerItemRowData.add(TableListTitle(title: "ID Number", width: 140));
    setPatientsRowData(widget.patientRecords);
  }

  void setPatientsRowData(List<MatchingPatient> patients) {
    rowItemDataList.clear();
    for (int i = 0; i < (patients?.length ?? 0); i++) {
      rowItemDataList.add([
        "${patientsServer + patients[i]?.profileImageUrl?.trim() ?? ""},${patients[i]?.name?.trim() ?? "—"}",
        "${(patients[i].birthDate == null) ? "—" : scDateFormat(patients[i].birthDate)}",
        "${(patients[i]?.idType == "") ? "—" : patients[i]?.idType?.trim() ?? "-"}",
        "${(patients[i].idNumber == null) ? "-" : patients[i].idNumber}",
      ]);
    }
  }

  void sortPatient(TableListTitle header, sortType sort) {
    int index = headerItemRowData.indexOf(header);
    switch (index) {
      case 0:
        if (sort == sortType.desc) {
          widget.patientRecords.sort((a, b) => a.name
              .toLowerCase()
              .trim()
              .compareTo(b.name.toLowerCase().trim()));
        } else {
          widget.patientRecords.sort((a, b) => b.name
              .toLowerCase()
              .trim()
              .compareTo(a.name.toLowerCase().trim()));
        }
        break;
      case 1:
        if (sort == sortType.desc) {
          widget.patientRecords
              .sort((a, b) => a.birthDate.compareTo(b.birthDate));
        } else {
          widget.patientRecords
              .sort((a, b) => b.birthDate.compareTo(a.birthDate));
        }
        break;
      case 2:
        if (sort == sortType.desc) {
          widget.patientRecords.sort((a, b) => a.idType.compareTo(b.idType));
        } else {
          widget.patientRecords.sort((a, b) => b.idType.compareTo(a.idType));
        }
        break;
      case 3:
        if (sort == sortType.desc) {
          widget.patientRecords
              .sort((a, b) => a.idNumber.trim().compareTo(b.idNumber.trim()));
        } else {
          widget.patientRecords
              .sort((a, b) => b.idNumber.trim().compareTo(a.idNumber.trim()));
        }
        break;
    }
    setPatientsRowData(widget.patientRecords);
    widget.bloc.dispatch(SortPatientItemsEvent(sort: currentSortType));
  }

  _showPatientViewPopup(context) {
    SlidingPopup.show(
        context: context,
        backgroundColor: bgColor,
        doneText: "Use This Record",
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 45,
          child: OKToast(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Builder(
                      builder: (ctx) => BlocBuilder<CreateEditPatientBloc,
                          CreateEditPatientState>(
                        bloc: widget.bloc,
                        condition: (preSate, currSate) {
                          return true;
                        },
                        builder: (context, state) {
                          if (state is LoadingBeginState) {
                            isPopupLoading = true;
                          } else if (state is LoadingEndState) {
                            isPopupLoading = false;
                          } else if (state is FetchSelectedPatientState) {
                            selectedPatientData = state.patient;
                            isPopupLoading = false;
                          }
                          return (isPopupLoading)
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
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      enabledBtnBGColor),
                                            )),
                                        Space(
                                          horizontal: 20,
                                        ),
                                        Text("fetching patient record",
                                            style: semiBoldLabelTextStyle(
                                                14, regularTextColor)),
                                      ],
                                    )),
                                  ),
                                )
                              : ViewPatientViewWidget(
                                  languageList: widget.languageList,
                                  maritalStatusList: widget.maritalStatusList,
                                  genderList: widget.genderList,
                                  relationshipList: widget.relationshipList,
                                  ownershipList: widget.ownershipList,
                                  insuranceList: widget.insuranceList,
                                  idTypeList: widget.idTypeList,
                                  patient: selectedPatientData,
                                  bloc: widget.bloc,
                                );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        width: 725,
        onCancel: () {
          Future<void>.delayed(Duration(milliseconds: 50), () {
            Navigator.pop(context);
          });
        },
        onSave: () {
          widget.bloc.dispatch(FetchPatientEvent(pid: selectedPatientId));
          Navigator.pop(context);
        },
        title: "View Patient");
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedPatientRecord);

    return BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
      bloc: this.widget.bloc,
      builder: (context, state) {
        if (state is SortedPatientItemsState) {}
        return body(context);
      },
    );
  }

  Widget body(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${rowItemDataList.length} SIMILAR RECORD FOUND",
            style: boldLabelTextStyle(12, textInputColor),
          ),
          Space(
            vertical: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              children: <Widget>[
                IntrinsicHeight(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TableListWidget(
                          headerList: headerItemRowData,
                          rowDataList: rowItemDataList,
                          isSingleSelection: true,
                          showThreeDotItemOption: false,
                          onItemClick: (index) {
                            selectedPatientId =
                                widget.patientRecords[index].patientId;
                            widget.bloc.dispatch(FetchSelectedPatientEvent(
                                pid: widget.patientRecords[index].patientId));
                            _showPatientViewPopup(context);
                          },
                          menuOptions: [],
                          pageItemCount: ListCount.TEN,
                          currentPage: 1,
                          lastPage: 1,
                          selectedItems: [widget.selectedPatientRecord],
                          onItemSelection: (index) {
                            if (index == widget.selectedPatientRecord) {
                              widget.bloc
                                  .dispatch(SelectPatientRecordEvent(-1));
                            } else {
                              widget.bloc
                                  .dispatch(SelectPatientRecordEvent(index));
                            }
                          },
                          onHeaderClick: (data) {
                            if (selectedHeader == data) {
                              if (currentSortType == sortType.asc) {
                                currentSortType = sortType.desc;
                              } else if (currentSortType == sortType.desc) {
                                currentSortType = sortType.asc;
                                selectedHeader = headerItemRowData[4];
                              }
                              sortPatient(selectedHeader, currentSortType);
                            } else {
                              currentSortType = sortType.asc;
                              selectedHeader = data;
                              sortPatient(selectedHeader, currentSortType);
                            }
                          },
                          totalItems: widget?.patientRecords?.length ?? 0,
                          showPagingOptions: false,
                        ),
                      ),
                    ],
                  ),
                ),
                Space(
                  vertical: 11,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "Select an existing patient record to continue. The new record you started creating will be discarded.",
                    style: semiBoldLabelTextStyle(13, labelTextStyleTextColor),
                  ),
                ),
                Space(
                  vertical: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Button(
                        height: 32,
                        width: 166,
                        text: "Use Selected Record",
                        buttonBackgroundColor:
                            (widget.selectedPatientRecord > -1)
                                ? enabledBtnBGColor
                                : disabledBtnBGColor,
                        style: semiBoldLabelTextStyle(15, enabledBtnTextColor),
                        onPressed: () {
                          widget.bloc.dispatch(FetchPatientEvent(
                              pid: widget
                                  .patientRecords[widget.selectedPatientRecord]
                                  .patientId));
                        },
                      ),
                      Space(
                        horizontal: 8,
                      ),
                      Button(
                        height: 32,
                        width: 208,
                        text: "Create New Record Anyway",
                        buttonBackgroundColor: bgColor,
                        style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
                        onPressed: () {
                          widget.bloc.dispatch(UseRecordAnywayEvent());
                        },
                      )
                    ],
                  ),
                ),
                Space(
                  vertical: 22,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
