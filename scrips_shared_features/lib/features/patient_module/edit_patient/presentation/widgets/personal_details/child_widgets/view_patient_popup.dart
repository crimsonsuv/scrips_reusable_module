import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/indicator_tag_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/id_type_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';

class ViewPatientViewWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Gender> genderList;
  final List<IdType> idTypeList;
  final List<MaritalStatus> maritalStatusList;
  final List<LanguageValueSetList> languageList;
  final List<Relationship> relationshipList;
  final List<Ownership> ownershipList;
  final List<Insurance> insuranceList;
  @override
  _ViewPatientViewWidgetState createState() => _ViewPatientViewWidgetState();
  ViewPatientViewWidget(
      {this.bloc,
      this.patient,
      this.languageList,
      this.insuranceList,
      this.relationshipList,
      this.ownershipList,
      this.genderList,
      this.maritalStatusList,
      this.idTypeList});
}

class _ViewPatientViewWidgetState extends State<ViewPatientViewWidget> {
  bool isMinor = false;
  int selectedPatientRecord = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: OKToast(
        child: BlocListener(
            bloc: widget.bloc,
            listener: (BuildContext context, state) {
              if (state is SelectedPatientTypeState) {
                isMinor = state.isMinor;
              } else if (state is SelectedPatientRecord) {
                selectedPatientRecord = state.index;
              }
            },
            child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
              bloc: widget.bloc,
              condition: (preSate, currSate) {
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
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
              bloc: widget.bloc,
              builder: (context, state) {
                return Container(
                    margin: EdgeInsets.only(top: 32),
                    child: BlocBuilder<CreateEditPatientBloc,
                        CreateEditPatientState>(
                      bloc: widget.bloc,
                      builder: (context, state) {
                        return Container(
                            margin:
                                EdgeInsets.only(left: 0, top: 0, bottom: 32),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("PATIENT MRN: ".toUpperCase(),
                                        style: boldLabelTextStyle(
                                            12.0, labelTextStyleTextColor)),
                                    Text('${widget.patient?.patientMrn ?? "—"}',
                                        style: normalLabelTextStyle(
                                            13.0, regularTextColor)),
                                    Space(
                                      horizontal: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Language: ".toUpperCase(),
                                        style: boldLabelTextStyle(
                                            12.0, labelTextStyleTextColor)),
                                    Text(
                                        ((widget.patient?.language ?? "") == "")
                                            ? "—"
                                            : '${widget.languageList?.where((data) => data.languageId == widget.patient?.language)?.toList()?.first?.code?.displayName?.trim() ?? "—"}',
                                        style: normalLabelTextStyle(
                                            13.0, regularTextColor)),
                                    Space(
                                      horizontal: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Last Update: ".toUpperCase(),
                                        style: boldLabelTextStyle(
                                            12.0, labelTextStyleTextColor)),
                                    Text(
                                        '${((widget.patient?.lastUpdated ?? null) == null) ? "—" : scDateFormat(widget.patient.lastUpdated)}',
                                        style: normalLabelTextStyle(
                                            13.0, regularTextColor)),
                                    Space(
                                      horizontal: 20,
                                    )
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Status: ".toUpperCase(),
                                        style: boldLabelTextStyle(
                                            12.0, labelTextStyleTextColor)),
                                    Text(
                                        '${((widget.patient?.isActive ?? false) ? "Active" : "Inactive")}',
                                        style: normalLabelTextStyle(
                                            13.0, regularTextColor)),
                                  ],
                                ),
                              ],
                            ));
                      },
                    ));
              },
            ),
            FormView(
                header: "PATIENT DETAILS".toUpperCase(),
                margin: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: bgColor,
                        ),
                        child: InkWell(
                          onTap: () async {},
                          child: (widget?.patient?.photoUrl == "" ||
                                  widget?.patient?.photoUrl == null)
                              ? Images.instance.userpic(
                                  fit: BoxFit.contain, height: 50, width: 50)
                              : Image.network(
                                  patientsServer + widget?.patient?.photoUrl ??
                                      "",
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ),
                    ),
                    Space(
                      vertical: 24,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Name",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget?.patient?.firstName ?? ""}${((widget?.patient?.middleName ?? "") == "") ? " " : (" " + (widget?.patient?.middleName ?? "") + " ")}${widget?.patient?.lastName ?? ""}",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Date of Birth",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            (widget?.patient?.birthDate == null)
                                ? "—"
                                : "${scDateFormat(widget?.patient?.birthDate)} (${(DateTime.now().difference(widget?.patient?.birthDate).inDays / 365).floor()} y ${(((DateTime.now().difference(widget?.patient?.birthDate).inDays) - (DateTime.now().difference(widget?.patient?.birthDate).inDays / 365).floor() * 365) / 30).floor()} m)",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Gender",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${widget.genderList?.where((data) => data.id == widget.patient?.gender)?.toList()?.first?.gender?.toLowerCase()?.capitalize() ?? "—"}',
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Marital Status",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ((widget?.patient?.maritalStatus ?? "") == "")
                                ? "—"
                                : '${widget.maritalStatusList?.where((data) => data.id == widget.patient?.maritalStatus)?.toList()?.first?.name?.toLowerCase()?.capitalize() ?? "—"}',
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Preferred Language",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ((widget?.patient?.language ?? "") == "")
                                ? "—"
                                : '${widget.languageList?.where((data) => data.languageId == widget?.patient?.language)?.toList()?.first?.code?.displayName?.toLowerCase()?.capitalize() ?? "—"}',
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 22,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Ownership",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${((widget.patient?.updatePatientContactRequest?.ownership ?? "") == "") ? "—" : widget.ownershipList?.where((data) => data.id == widget.patient?.updatePatientContactRequest?.ownership)?.toList()?.elementAt(0)?.name?.toLowerCase()?.capitalize() ?? "—"}',
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Email Address",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${isBlank(widget?.patient?.updatePatientContactRequest?.email) ? "—" : widget?.patient?.updatePatientContactRequest?.email ?? "—"}",
                                style:
                                    normalLabelTextStyle(15, regularTextColor),
                              ),
                              Space(
                                horizontal: 8,
                              ),
                              (widget?.patient?.updatePatientContactRequest
                                          ?.isPreferrable ==
                                      0)
                                  ? IndicatorTagWidget(
                                      indicatorText: "Preferred",
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Primary Contact Number",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${isBlank(widget?.patient?.updatePatientContactRequest?.primaryContact) ? "—" : widget?.patient?.updatePatientContactRequest?.primaryContact ?? "—"}",
                                style:
                                    normalLabelTextStyle(15, regularTextColor),
                              ),
                              Space(
                                horizontal: 8,
                              ),
                              (widget?.patient?.updatePatientContactRequest
                                          ?.isPreferrable ==
                                      1)
                                  ? IndicatorTagWidget(
                                      indicatorText: "Preferred",
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Secondary Contact Number",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "${isBlank(widget?.patient?.updatePatientContactRequest?.secondayContact) ? "—" : widget?.patient?.updatePatientContactRequest?.secondayContact ?? "—"}",
                                style:
                                    normalLabelTextStyle(15, regularTextColor),
                              ),
                              Space(
                                horizontal: 8,
                              ),
                              (widget?.patient?.updatePatientContactRequest
                                          ?.isPreferrable ==
                                      2)
                                  ? IndicatorTagWidget(
                                      indicatorText: "Preferred",
                                    )
                                  : Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Residential Address",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ((widget?.patient?.updatePatientContactRequest
                                            ?.address ??
                                        "") ==
                                    "")
                                ? "—"
                                : "${widget?.patient?.updatePatientContactRequest?.address ?? "—"}, ${widget?.patient?.updatePatientContactRequest?.city ?? "—"}, ${widget?.patient?.updatePatientContactRequest?.country ?? "—"}",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 22,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "ID Type",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.idTypeList?.where((data) => data.id == widget.patient?.identification?.idType)?.toList()?.first?.name?.toLowerCase()?.capitalize() ?? "—"}",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "ID Number",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget?.patient?.identification?.idNumber ?? "—"}",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "ID Expiration Date",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${(widget.patient.identification.idExpirationDate == null) ? "—" : scDateFormat(widget?.patient?.identification?.idExpirationDate)}",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "ID Front Side",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "—",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 14,
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "ID Back Side",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "—",
                            style: normalLabelTextStyle(15, regularTextColor),
                          ),
                        )
                      ],
                    ),
                    Space(
                      vertical: 22,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Emergency Contact",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        ((widget?.patient?.emergencyContactResponse?.length ??
                                    0) ==
                                0)
                            ? Expanded(
                                child: Text(
                                  "—",
                                  style: normalLabelTextStyle(
                                      15, regularTextColor),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  height: (32.0 *
                                      (widget?.patient?.emergencyContactResponse
                                              ?.length ??
                                          0)),
                                  child: IntrinsicHeight(
                                    child: ListView.builder(
                                        itemCount: widget
                                                ?.patient
                                                ?.emergencyContactResponse
                                                ?.length ??
                                            0,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 0),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Flexible(
                                                    child: Text(
                                                      "${widget?.patient?.emergencyContactResponse[index]?.contactNumber?.trim() ?? "-"} • ${widget?.patient?.emergencyContactResponse[index]?.firstName?.trim() ?? "N/A"} ${widget?.patient?.emergencyContactResponse[index]?.lastName?.trim() ?? "N/A"} • ${'${widget.relationshipList?.where((data) => data.id == widget.patient?.emergencyContactResponse[index]?.relationship)?.toList()?.first?.name ?? "N/A"}'}",
                                                      style:
                                                          normalLabelTextStyle(
                                                              15,
                                                              regularTextColor),
                                                      softWrap: false,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      maxLines: 1,
                                                    ),
                                                  ),
                                                  Space(
                                                    horizontal: 8,
                                                  ),
                                                  (widget
                                                              ?.patient
                                                              ?.emergencyContactResponse[
                                                                  index]
                                                              ?.isProxy ??
                                                          false)
                                                      ? IndicatorTagWidget(
                                                          indicatorText:
                                                              "Proxy")
                                                      : Container(),
                                                ],
                                              ),
                                              Space(
                                                vertical: 10,
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              )
                      ],
                    ),
                    Space(
                      vertical: 22,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 216,
                          child: Text(
                            "Health Insurance",
                            style:
                                boldLabelTextStyle(15, labelTextStyleTextColor),
                          ),
                        ),
                        ((widget?.patient?.healthInsuranceResponse?.length ??
                                    0) ==
                                0)
                            ? Expanded(
                                child: Text(
                                  "—",
                                  style: normalLabelTextStyle(
                                      15, regularTextColor),
                                ),
                              )
                            : Expanded(
                                child: Container(
                                  height: ((44.0 + 18 + 10) *
                                      (widget.patient?.healthInsuranceResponse
                                              ?.length ??
                                          0)),
                                  child: IntrinsicHeight(
                                    child: ListView.builder(
                                        itemCount: widget
                                                .patient
                                                ?.healthInsuranceResponse
                                                ?.length ??
                                            0,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.only(top: 0),
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                children: <Widget>[
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Flexible(
                                                        child: Text(
                                                          "${'${widget.insuranceList?.where((data) => data.id == widget.patient?.healthInsuranceResponse[index]?.insuranceProvider)?.toList()?.first?.insuranceProvider1 ?? "N/A"}'} • ${widget?.patient?.healthInsuranceResponse[index]?.policyNumber ?? ""}",
                                                          style: normalLabelTextStyle(
                                                              15,
                                                              regularTextColor),
                                                          maxLines: 1,
                                                          softWrap: false,
                                                          overflow:
                                                              TextOverflow.fade,
                                                        ),
                                                      ),
                                                      Space(
                                                        horizontal: 8,
                                                      ),
                                                      (index == 0)
                                                          ? IndicatorTagWidget(
                                                              indicatorText:
                                                                  "Primary")
                                                          : ((index == 1)
                                                              ? IndicatorTagWidget(
                                                                  indicatorText:
                                                                      "Secondary")
                                                              : Container()),
                                                    ],
                                                  ),
                                                  Space(
                                                    vertical: 10,
                                                  ),
                                                  Text(
                                                    "Eligibility Start Date: ${(widget?.patient?.healthInsuranceResponse[index]?.eligiblityStartDate == null) ? "N/A" : scDateFormat(widget?.patient?.healthInsuranceResponse[index]?.eligiblityStartDate)} • Expiration Date: ${(widget?.patient?.healthInsuranceResponse[index]?.expirationDate == null) ? "N/A" : scDateFormat(widget?.patient?.healthInsuranceResponse[index]?.expirationDate)}",
                                                    style: normalLabelTextStyle(
                                                        15, regularTextColor),
                                                  ),
                                                ],
                                              ),
                                              Space(
                                                vertical: 18,
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              )
                      ],
                    ),
                  ],
                )),
            Space(
              vertical: 24,
            ),
          ],
        ),
      ),
    );
  }
}
