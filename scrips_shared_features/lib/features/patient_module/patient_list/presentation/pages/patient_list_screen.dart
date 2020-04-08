import 'package:after_init/after_init.dart';
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
import 'package:scrips_core/widgets/general/table_list_widget.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

typedef PatientCallBack(PatientDatum patientData);

enum sortType { asc, desc }

class PatientListScreen extends StatefulWidget {
  PatientListScreen(
      {Key key,
      this.pushEditPatient,
      this.pushCreatePatient,
      this.orgId,
      this.practiceId})
      : super(key: key);

  final PatientCallBack pushEditPatient;
  final Function pushCreatePatient;
  final String orgId;
  final String practiceId;

  @override
  _PatientListScreenState createState() => _PatientListScreenState();
}

class _PatientListScreenState extends State<PatientListScreen>
    with AfterInitMixin<PatientListScreen> {
  TextEditingController _textEditController;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final bloc = sl<PatientListBloc>();
  //List<PatientDatum> patients;
  double fixedSubMenuWidgetWidth = 231.0;
  bool isLoading = false;
  int selectedPageSize = 10;
  int totalPatientData = 0;
  String selectedQuery = "";
  int currentPage = 1;
  int totalPage = 1;
  TableListTitle selectedHeader;
  bool isArchived = false;
  List<TableListTitle> headerItemRowData = [];
  List<List<String>> rowItemDataList = [];
  List<int> selectedPatientIndexes = [];
  sortType currentSortType = sortType.asc;
  List<PatientDatum> patientsData;

  @override
  void initState() {
    _textEditController = TextEditingController();
    super.initState();

    headerItemRowData.add(TableListTitle(title: "Name", width: 160));
    headerItemRowData.add(TableListTitle(title: "Date Of Birth", width: 160));
    headerItemRowData.add(TableListTitle(title: "MRN", width: 140));
    headerItemRowData
        .add(TableListTitle(title: "Preferred Contact", width: 200));
    headerItemRowData.add(TableListTitle(title: "Last Update", width: 130));
    headerItemRowData.add(TableListTitle(title: "Status", width: 120));

    selectedHeader = headerItemRowData[4];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  @override
  void didInitState() {
    _refreshPatientsList(
        query: selectedQuery,
        isArchived: isArchived,
        pageSize: selectedPageSize,
        currentPage: 1);
  }

  void setPatientsRowData(List<PatientDatum> patients) {
    rowItemDataList.clear();
    for (int i = 0; i < (patients?.length ?? 0); i++) {
      rowItemDataList.add([
        "${((patients[i]?.image?.trim()?.length ?? 0) == 0) ? "" : patientsTestServer + patients[i]?.image?.trim() ?? ""},${patients[i]?.name?.trim() ?? "—"}",
        "${(patients[i].birthDate == null) ? "—" : scDateFormat(patients[i].birthDate)}",
        "${patients[i]?.mrn ?? "-"}",
        "${(patients[i]?.contactNumber == "") ? "—" : patients[i]?.contactNumber?.trim() ?? "-"}",
        "${(patients[i].lastUpdated == null) ? "-" : scDateFormat(patients[i].lastUpdated)}",
        "${(patients[i]?.status ?? true) ? "Active" : "Inactive"}"
      ]);
    }
  }

  void sortPatient(TableListTitle header, sortType sort) {
    int index = headerItemRowData.indexOf(header);
    switch (index) {
      case 0:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) => a.name
              .toLowerCase()
              .trim()
              .compareTo(b.name.toLowerCase().trim()));
        } else {
          patientsData.sort((a, b) => b.name
              .toLowerCase()
              .trim()
              .compareTo(a.name.toLowerCase().trim()));
        }
        break;
      case 1:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) => a.birthDate.compareTo(b.birthDate));
        } else {
          patientsData.sort((a, b) => b.birthDate.compareTo(a.birthDate));
        }
        break;
      case 2:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) => a.mrn.compareTo(b.mrn));
        } else {
          patientsData.sort((a, b) => b.mrn.compareTo(a.mrn));
        }
        break;
      case 3:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) =>
              a.contactNumber.trim().compareTo(b.contactNumber.trim()));
        } else {
          patientsData.sort((a, b) =>
              b.contactNumber.trim().compareTo(a.contactNumber.trim()));
        }
        break;
      case 4:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) => a.lastUpdated.compareTo(b.lastUpdated));
        } else {
          patientsData.sort((a, b) => b.lastUpdated.compareTo(a.lastUpdated));
        }
        break;
      case 5:
        if (sort == sortType.desc) {
          patientsData.sort((a, b) => (a.status ? "Active" : "Inactive")
              .compareTo((b.status ? "Active" : "Inactive")));
        } else {
          patientsData.sort((a, b) => (b.status ? "Active" : "Inactive")
              .compareTo((a.status ? "Active" : "Inactive")));
        }
        break;
    }
    setPatientsRowData(patientsData);
    bloc.dispatch(SortPatientItemsEvent(sort: currentSortType));
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is ErrorState) {
              showToastWidget(
                ToastWidget(
                  message: state.message,
                  backgroundColor: red,
                ),
                position: ToastPosition.top,
                context: context,
                duration: Duration(seconds: 4),
              );
            } else if (state is SetItemSelection) {
              selectedPatientIndexes = state.indexs;
            }
            if (state is PracticeFetchByQueryState) {
              totalPatientData = state?.patientsList?.count ?? 0;
              totalPage = state?.patientsList?.totalPage ?? 0;
              currentPage = state?.patientsList?.currentPage ?? 0;
              patientsData = state.patientsList.patientData;
              if ((state?.patientsList?.patientData?.length ?? 0) == 0) {
                setPatientsRowData(state?.patientsList?.patientData);
                showToastWidget(
                  ToastWidget(
                    message: "No matching patients found",
                    backgroundColor: Colors.black45,
                  ),
                  position: ToastPosition.top,
                  context: context,
                  duration: Duration(seconds: 2),
                );
              }
//              if ((state?.patientsList?.patientData?.length ?? 0) > 0) {
//                if ((state?.organizations?.length ?? 0) >
//                    (organizations?.length ?? 0)) {
//                  showToastWidget(
//                    ToastWidget(
//                      message:
//                          "Successfully created an organization account and sent the invite",
//                      backgroundColor: red,
//                    ),
//                    position: ToastPosition.top,
//                    context: context,
//                    duration: Duration(seconds: 2),
//                  );
//                }
//              }
              setPatientsRowData(state?.patientsList?.patientData);
            } else if (state is LoadingBeginState) {
              isLoading = true;
            } else if (state is LoadingEndState) {
              isLoading = false;
            } else if (state is SortedPatientItemsState) {
              //sortPatient(selectedHeader, state.sort);
            } else if (state is ChangeArchiveStatusState) {
              isArchived = !isArchived;
              _refreshPatientsList(
                  query: selectedQuery,
                  pageSize: selectedPageSize,
                  currentPage: 1,
                  isArchived: isArchived);
            } else if (state is ArchivedPatientState) {
              _refreshPatientsList(
                  query: selectedQuery,
                  pageSize: selectedPageSize,
                  currentPage: 1,
                  isArchived: isArchived);
            }
          },
          child: BlocBuilder<PatientListBloc, PatientListState>(
            bloc: bloc,
            builder: (context, state) {
              return RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  await _refreshPatientsList(
                      query: selectedQuery,
                      pageSize: selectedPageSize,
                      currentPage: 1,
                      isArchived: isArchived);
                },
                child: kIsWeb
                    ? ListView(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: patientListBody())
                    : Stack(children: patientListBody()),
              );
            },
          )),
    );
  }

  dynamic patientListBody() => [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: bgColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Space(
                            vertical: 29,
                          ),
                          Container(
                            child: Text(
                              "Patients".toUpperCase(),
                              style: boldLabelTextStyle(
                                  12.0, labelTextStyleTextColor),
                            ),
                          ),
                          Space(
                            vertical: 19,
                          ),
                          Container(
                            child: Text(
                              "$totalPatientData Patients",
                              style: boldLabelTextStyle(24.0, textInputColor),
                            ),
                          ),
                          Space(
                            vertical: 24,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            //margin: EdgeInsets.only(left: 24.0, top: 0.0),
                            child: Button(
                              height: 32,
                              width: 72,
                              buttonBackgroundColor: enabledBtnBGColor,
                              onPressed: () {
                                widget.pushCreatePatient();
                              },
                              text: "Add",
                              style: boldLabelTextStyle(
                                  14.0, disabledBtnTextColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1,
                color: separatorColor,
              ),
              Container(
                height: 60,
                child: (selectedPatientIndexes.length > 0)
                    ? Column(
                        children: <Widget>[
                          Container(
                            height: 48,
                            color: enabledBtnTextColor,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "${selectedPatientIndexes.length} selected",
                                          style: normalLabelTextStyle(
                                              13, regularTextColor),
                                        ),
                                        Space(
                                          horizontal: 32,
                                        ),
                                        InkWell(
                                          child: Text(
                                            "Unselect All",
                                            style: semiBoldLabelTextStyle(
                                                13, enabledBtnBGColor),
                                          ),
                                          onTap: () {
                                            selectedPatientIndexes.clear();
                                            bloc.dispatch(SelectPatientItems(
                                                indexs:
                                                    selectedPatientIndexes));
                                          },
                                        ),
                                        Space(
                                          horizontal: 32,
                                        ),
                                        InkWell(
                                          child: Text("Archive",
                                              style: semiBoldLabelTextStyle(
                                                  13, enabledBtnBGColor)),
                                          onTap: () {
                                            confirmDialog(
                                                context: context,
                                                title:
                                                    "Do you really want to archive selected accounts?",
                                                message:
                                                    "We will inform patients about this change. You can unarchive these accounts later in Account Settings.",
                                                isRemove: true,
                                                onYes: () {
                                                  List<String> patientIds = [];
                                                  selectedPatientIndexes
                                                      .forEach((data) {
                                                    patientIds.add(
                                                        patientsData[data]
                                                            .patientId);
                                                  });
                                                  bloc.dispatch(
                                                      ArchivePatientEvent(
                                                          patientIDs:
                                                              patientIds));
                                                });
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  color: separatorColor,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          )
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18, left: 24, right: 24, bottom: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: 36.0,
                                  decoration: BoxDecoration(
                                      color: searchBGColour,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Container(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Images.instance.searchIcon(
                                              width: 14, height: 14),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 8),
                                          width: 279,
                                          height: 36,
                                          child: TextField(
                                            style: defaultFieldStyle(
                                                regularTextColor, null),
                                            textAlign: TextAlign.start,
                                            enabled: true,
                                            controller: _textEditController,
                                            onSubmitted: (query) async {
                                              selectedQuery = query;
                                              await _refreshPatientsList(
                                                  query: query,
                                                  pageSize: selectedPageSize,
                                                  currentPage: 1,
                                                  isArchived: isArchived);
                                            },
                                            decoration: InputDecoration(
                                                counterText: "",
                                                hintText:
                                                    "Name, DOB, MRN, Contact Number",
                                                hintStyle: defaultHintStyle(
                                                    null, null),
                                                contentPadding:
                                                    EdgeInsets.only(bottom: 12),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: searchBGColour,
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0))),
                                          height: 36,
                                          child: Center(
                                              child: IconButton(
                                                  icon: Icon(
                                                    Icons.clear,
                                                    size: 20,
                                                  ),
                                                  color: Colors.grey,
                                                  onPressed: () async {
                                                    selectedQuery = "";
                                                    _textEditController.clear();
                                                    _refreshPatientsList(
                                                        query: selectedQuery,
                                                        pageSize:
                                                            selectedPageSize,
                                                        currentPage: 1,
                                                        isArchived: isArchived);
                                                  })),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  height: 36,
                                  child: Center(
                                    child: Text(
                                      S.of(context).press_enter_to_search,
                                      style:
                                          normalLabelTextStyle(12, Colors.grey),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container()),
                                InkWell(
                                  onTap: () {
                                    bloc.dispatch(ChangeArchiveStatusEvent());
                                  },
                                  child: Text(
                                    (isArchived)
                                        ? "View Active Patients"
                                        : "View Archived Patients",
                                    style: semiBoldLabelTextStyle(
                                        13, enabledBtnBGColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          )
                        ],
                      ),
              ),
              Expanded(
                child: (isLoading)
                    ? Center(
                        child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                      ))
                    : TableListWidget(
                        headerList: headerItemRowData,
                        rowDataList: rowItemDataList,
                        showThreeDotItemOption: true,
                        selectedHeader: selectedHeader,
                        onPageClick: (page) {
                          currentPage = page;
                          _refreshPatientsList(
                              query: selectedQuery,
                              isArchived: isArchived,
                              pageSize: selectedPageSize,
                              currentPage: currentPage);
                        },
                        onItemClick: (index) {
                          print(index);
                          widget.pushEditPatient(patientsData[index]);
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
                        onPageCountSelection: (count) {
                          currentPage = 1;
                          selectedPageSize = count;
                          _refreshPatientsList(
                              query: selectedQuery,
                              isArchived: isArchived,
                              pageSize: selectedPageSize,
                              currentPage: currentPage);
                        },
                        menuOptions: (isArchived)
                            ? [
                                MenuOptions(
                                    title: "Edit Patient Details",
                                    icon: Images.instance
                                        .edit(color: Colors.black),
                                    onClick: (index) {
                                      print(index);
                                      widget
                                          .pushEditPatient(patientsData[index]);
                                    }),
                              ]
                            : [
                                MenuOptions(
                                    title: "Edit Patient Details",
                                    icon: Images.instance
                                        .edit(color: Colors.black),
                                    onClick: (index) {
                                      print(index);
                                      widget
                                          .pushEditPatient(patientsData[index]);
                                    }),
                                MenuOptions(
                                    title: "Archive Patient",
                                    icon: Images.instance
                                        .archiveIcon(color: Colors.red),
                                    color: Colors.red,
                                    onClick: (index) {
                                      confirmDialog(
                                          context: context,
                                          title: S
                                              .of(context)
                                              .do_you_really_want_to_archive_this_account,
                                          message:
                                              "We will inform the patient about this change. You can unarchive this account later in Account Settings.",
                                          isRemove: true,
                                          onYes: () {
                                            bloc.dispatch(ArchivePatientEvent(
                                                patientIDs: [
                                                  patientsData[index].patientId
                                                ]));
                                          });
                                    })
                              ],
                        pageItemCount: intToCount(selectedPageSize),
                        currentPage: currentPage,
                        lastPage: totalPage,
                        onNextPage: () {
                          currentPage = currentPage + 1;
                          _refreshPatientsList(
                              query: selectedQuery,
                              isArchived: isArchived,
                              pageSize: selectedPageSize,
                              currentPage: currentPage);
                        },
                        onPreviousPage: () {
                          currentPage = currentPage - 1;
                          _refreshPatientsList(
                              query: selectedQuery,
                              isArchived: isArchived,
                              pageSize: selectedPageSize,
                              currentPage: currentPage);
                        },
                        selectedItems: selectedPatientIndexes,
                        onAllSelection: () {
                          if (selectedPatientIndexes.length ==
                              rowItemDataList.length) {
                            selectedPatientIndexes.clear();
                          } else {
                            selectedPatientIndexes.clear();
                            for (int i = 0; i < rowItemDataList.length; i++) {
                              selectedPatientIndexes.add(i);
                            }
                          }
                          bloc.dispatch(SelectPatientItems(
                              indexs: selectedPatientIndexes));
                        },
                        onItemSelection: (index) {
                          if (selectedPatientIndexes
                                  .where((data) => data == index)
                                  .toList()
                                  .length >
                              0) {
                            selectedPatientIndexes.remove(index);
                          } else {
                            selectedPatientIndexes.add(index);
                          }
                          bloc.dispatch(SelectPatientItems(
                              indexs: selectedPatientIndexes));
                        },
                        totalItems: totalPatientData,
                        showPagingOptions: true,
                      ),
              ),
              Space(
                vertical: 30,
              )
            ],
          ),
        ),
      ];

  Future<void> _refreshPatientsList(
      {String query, int pageSize, int currentPage, bool isArchived}) async {
    selectedHeader = headerItemRowData[4];
    currentSortType = sortType.asc;
    selectedPatientIndexes.clear();
    selectedPageSize = pageSize;
    currentPage = currentPage;
    isArchived = isArchived;
    bloc.dispatch(PatientsFetchByQueryEvent(
      orgId: widget.orgId,
      practiceId: widget.practiceId,
      pageSize: selectedPageSize,
      pageNum: currentPage,
      query: query,
      isArchived: isArchived,
    ));
  }
}
