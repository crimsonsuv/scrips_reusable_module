import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/indicator_tag_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/widgets/contact_details/health_insurance/edit_health_insurance_widget.dart';

class HealthInsuranceWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Insurance> insuranceList;
  @override
  _HealthInsuranceWidgetState createState() => _HealthInsuranceWidgetState();
  HealthInsuranceWidget(
      {this.isEdit, this.bloc, this.patient, this.insuranceList});
}

class _HealthInsuranceWidgetState extends State<HealthInsuranceWidget> {
  int selectedIndex;
  int totalItem = 0;
  bool isEdit = false;
  //InsuranceList selectedInsurance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = -1;
    totalItem = (widget?.patient?.healthInsuranceResponse?.length ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    totalItem = (widget?.patient?.healthInsuranceResponse?.length ?? 0);
    return BlocListener(
        bloc: widget.bloc,
        listener: (BuildContext context, state) {
          if (state is EnableSaveInsuranceState) {
            widget.patient.healthInsuranceResponse[selectedIndex] =
                state.insurance;
          } else if (state is UpdateInsuranceListState) {
            widget.patient.healthInsuranceResponse =
                state.patient.healthInsuranceResponse;
            totalItem = (state?.patient?.healthInsuranceResponse?.length ?? 0);
          } else if (state is SelectedTabState) {
            widget.patient.healthInsuranceResponse.removeWhere((data) {
              return data.healthInsuranceId == null &&
                  (isBlank(data.insuranceProvider) ||
                      isBlank(data.policyNumber) ||
                      data.expirationDate == null);
            });
          }
        },
        child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
          bloc: widget.bloc,
          condition: (preSate, currSate) {
            if (currSate is EnablePatientSaveState ||
                currSate is EnableSaveInsuranceState) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            return body(context);
          },
        ));
  }

  Widget body(BuildContext context) {
    return FormView(
      header: "HEALTH INSURANCE".toUpperCase(),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height:
                (97.0 * (totalItem - 1)) + ((selectedIndex > -1) ? 248 : 97),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: totalItem,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return (selectedIndex == index)
                      ? EditHealthInsuranceWidget(
                          isEdit: isEdit,
                          insuranceItemList:
                              widget.patient.healthInsuranceResponse,
                          insuranceItem:
                              widget.patient.healthInsuranceResponse[index],
                          insuranceList: widget.insuranceList,
                          bloc: widget.bloc,
                          onCancel: () {
                            if (widget
                                        .patient
                                        .healthInsuranceResponse[selectedIndex]
                                        .healthInsuranceId ==
                                    null &&
                                !isEdit) {
                              widget.patient.healthInsuranceResponse
                                  .removeAt(selectedIndex);
                            }
                            selectedIndex = -1;
                            widget.bloc.add(UpdateInsuranceListEvent(
                                patient: widget.patient));
                          },
                          onRemove: () {
                            if (widget
                                    ?.patient
                                    ?.healthInsuranceResponse[selectedIndex]
                                    ?.isPrimary ??
                                false) {
                              if ((widget?.patient?.healthInsuranceResponse
                                          ?.length ??
                                      0) >
                                  1) {
                                widget.patient.healthInsuranceResponse
                                    .removeAt(selectedIndex);
                                widget.patient.healthInsuranceResponse.first
                                    .isPrimary = true;
                              } else {
                                widget.patient.healthInsuranceResponse
                                    .removeAt(selectedIndex);
                              }
                            }
                            selectedIndex = -1;
                            widget.bloc.add(UpdateInsuranceListEvent(
                                patient: widget.patient));
                          },
                          onSave: (InsuranceList data) {
                            if ((widget.patient.healthInsuranceResponse
                                        ?.where((hlIns) =>
                                            (hlIns.policyNumber ==
                                                data.policyNumber) &&
                                            (hlIns.insuranceProvider ==
                                                data.insuranceProvider))
                                        ?.toList()
                                        ?.length ??
                                    0) >
                                1) {
                              widget.bloc.add(ShowErrorMessageEvent(
                                  message: "Health Insurance already added"));
                              return;
                            }
                            selectedIndex = -1;
                            widget.patient.healthInsuranceResponse[index] =
                                data;
                            widget.bloc.add(UpdateInsuranceListEvent(
                                patient: widget.patient));
                          },
                          isPrimary: widget
                                  ?.patient
                                  ?.healthInsuranceResponse[selectedIndex]
                                  ?.isPrimary ??
                              false,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              height: 96,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              "${(widget.patient?.healthInsuranceResponse[index].insuranceProvider != null) ? widget?.insuranceList?.where((data) => data.id == widget.patient?.healthInsuranceResponse[index].insuranceProvider)?.toList()?.first?.insuranceProvider1 ?? "N/A" : "N/A"}",
                                              style: boldLabelTextStyle(
                                                  15, textInputColor),
                                            ),
                                            Space(
                                              horizontal: 8,
                                            ),
                                            (widget
                                                        .patient
                                                        ?.healthInsuranceResponse[
                                                            index]
                                                        ?.isPrimary ??
                                                    false)
                                                ? IndicatorTagWidget(
                                                    indicatorText: "Primary",
                                                  )
                                                : IndicatorTagWidget(
                                                    indicatorText: "Secondary",
                                                  )
                                          ],
                                        ),
                                        Space(
                                          vertical: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Images.instance.smallHash(),
                                            Space(
                                              horizontal: 8,
                                            ),
                                            Text(
                                              "${widget.patient?.healthInsuranceResponse[index]?.policyNumber ?? "N/A"}",
                                              style: normalLabelTextStyle(
                                                  15, regularTextColor),
                                            )
                                          ],
                                        ),
                                        Space(
                                          vertical: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Images.instance.appointmentIcon(
                                                height: 16, width: 16),
                                            Space(
                                              horizontal: 8,
                                            ),
                                            Text(
                                              "Eligibility Start Date: ${(widget.patient?.healthInsuranceResponse[index]?.eligiblityStartDate == null) ? "N/A" : scDateFormat(widget.patient?.healthInsuranceResponse[index]?.eligiblityStartDate)} • Expiration Date: ${(widget.patient?.healthInsuranceResponse[index]?.expirationDate == null) ? "N/A" : scDateFormat(widget.patient?.healthInsuranceResponse[index]?.expirationDate)}",
                                              style: normalLabelTextStyle(
                                                  15, regularTextColor),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Button(
                                      height: 32,
                                      width: 70,
                                      text: "Edit",
                                      onPressed: () {
                                        widget.patient.healthInsuranceResponse
                                            .removeWhere((data) {
                                          return data.healthInsuranceId ==
                                                  null &&
                                              (isBlank(
                                                      data.insuranceProvider) ||
                                                  isBlank(data.policyNumber) ||
                                                  data.expirationDate == null);
                                        });
                                        isEdit = true;
                                        selectedIndex = index;
                                        widget.bloc.add(
                                            UpdateInsuranceListEvent(
                                                patient: widget.patient));
                                      },
                                      buttonBackgroundColor: textFieldBGcolor,
                                      style: semiBoldLabelTextStyle(
                                          15, enabledBtnBGColor),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            (index == totalItem - 1 && selectedIndex > -1)
                                ? Container()
                                : Container(
                                    height: 1,
                                    color: separatorColor,
                                  )
                          ],
                        );
                }),
          ),
          (selectedIndex < 0 &&
                  (widget?.patient?.healthInsuranceResponse?.length ?? 0) < 2)
              ? InkWell(
                  onTap: () {
                    isEdit = false;
                    widget.patient.healthInsuranceResponse.add(InsuranceList(
                        patientId: widget
                            .patient.updatePatientContactRequest.patientId,
                        isPrimary: ((widget?.patient?.healthInsuranceResponse
                                    ?.length ??
                                0) ==
                            0)));
                    selectedIndex =
                        (widget?.patient?.healthInsuranceResponse?.length ??
                                0) -
                            1;
                    widget.bloc
                        .add(UpdateInsuranceListEvent(patient: widget.patient));
                  },
                  child: Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        (totalItem > 0)
                            ? "Add Another Health Insurance"
                            : "Add Health Insurance",
                        style: semiBoldLabelTextStyle(17, enabledBtnBGColor),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
