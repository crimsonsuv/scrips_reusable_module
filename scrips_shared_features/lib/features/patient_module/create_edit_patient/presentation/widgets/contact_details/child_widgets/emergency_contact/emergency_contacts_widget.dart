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
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/patient_module/create_edit_patient/presentation/widgets/contact_details/child_widgets/emergency_contact/edit_emergency_contact_widget.dart';

class EmergencyContactsWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Relationship> relationshipList;
  @override
  _EmergencyContactsWidgetState createState() =>
      _EmergencyContactsWidgetState();
  EmergencyContactsWidget(
      {this.patient, this.bloc, this.isEdit, this.relationshipList});
}

class _EmergencyContactsWidgetState extends State<EmergencyContactsWidget> {
  int selectedIndex;
  int totalItem = 0;
  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = -1;
    totalItem = (widget?.patient?.emergencyContactResponse?.length ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    totalItem = (widget?.patient?.emergencyContactResponse?.length ?? 0);
    return BlocListener(
        bloc: widget.bloc,
        listener: (BuildContext context, state) {
          if (state is EnableSaveEmergencyContactState) {
            widget.patient.emergencyContactResponse[selectedIndex] =
                state.emergencyContact;
          } else if (state is UpdateEmergencyContactListState) {
            widget.patient.emergencyContactResponse =
                state.patient.emergencyContactResponse;
            totalItem = (state?.patient?.emergencyContactResponse?.length ?? 0);
          } else if (state is SelectedTabState) {
            widget.patient.emergencyContactResponse.removeWhere((data) {
              return data.emergencyContactId == null &&
                  (isBlank(data.firstName) ||
                      isBlank(data.lastName) ||
                      isBlank(data.contactNumber));
            });
          }
        },
        child: BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
          bloc: widget.bloc,
          condition: (preSate, currSate) {
            if (currSate is EnablePatientSaveState ||
                currSate is EnableSaveEmergencyContactState) {
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
      header: "EMERGENCY CONTACTS".toUpperCase(),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: (97.0 * (totalItem - 1)) +
                ((selectedIndex > -1) ? (389.0 + 24) : 97),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemCount: totalItem,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return (selectedIndex == index)
                      ? EditEmergencyContactWidget(
                          isEdit: isEdit,
                          emergencyContactItem:
                              widget.patient.emergencyContactResponse[index],
                          relationshipList: widget.relationshipList,
                          bloc: widget.bloc,
                          onCancel: () {
                            if (widget
                                        .patient
                                        .emergencyContactResponse[selectedIndex]
                                        .emergencyContactId ==
                                    null &&
                                !isEdit) {
                              widget.patient.emergencyContactResponse
                                  .removeAt(selectedIndex);
                            }
                            selectedIndex = -1;
                            widget.bloc.dispatch(
                                UpdateEmergencyContactListEvent(
                                    patient: widget.patient));
                          },
                          onRemove: () {
                            selectedIndex = -1;
                            widget.patient.emergencyContactResponse
                                .removeAt(index);
                            widget.bloc.dispatch(
                                UpdateEmergencyContactListEvent(
                                    patient: widget.patient));
                          },
                          onSave: (EmergencyContactList data) {
                            if ((widget.patient.emergencyContactResponse
                                        ?.where((emgCon) => emgCon.contactNumber
                                            .contains(data.contactNumber))
                                        ?.toList()
                                        ?.length ??
                                    0) >
                                1) {
                              widget.bloc.dispatch(ShowErrorMessageEvent(
                                  message:
                                      "Emergency Contact Number already added"));
                              return;
                            }
                            selectedIndex = -1;
                            widget.patient.emergencyContactResponse[index] =
                                data;
                            if (widget.patient.emergencyContactResponse[index]
                                    ?.isProxy ??
                                false) {
                              widget.patient.emergencyContactResponse
                                  .forEach((data) {
                                data.isProxy = false;
                              });
                              widget.patient.emergencyContactResponse[index]
                                  .isProxy = true;
                            }
                            widget.bloc.dispatch(
                                UpdateEmergencyContactListEvent(
                                    patient: widget.patient));
                          },
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
                                              "${widget?.patient?.emergencyContactResponse[index]?.firstName ?? "-"} ${widget?.patient?.emergencyContactResponse[index]?.lastName ?? "-"}",
                                              style: boldLabelTextStyle(
                                                  15, textInputColor),
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
                                                    indicatorText: "Proxy",
                                                  )
                                                : Container()
                                          ],
                                        ),
                                        Space(
                                          vertical: 8,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Images.instance.smallPhone(),
                                            Space(
                                              horizontal: 8,
                                            ),
                                            Text(
                                              "${widget?.patient?.emergencyContactResponse[index]?.contactNumber ?? "N/A"}",
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
                                            Images.instance.smallUser(),
                                            Space(
                                              horizontal: 8,
                                            ),
                                            Text(
                                              "${(widget.patient?.emergencyContactResponse[index].relationship != null) ? widget?.relationshipList?.where((data) => data.id == widget.patient?.emergencyContactResponse[index].relationship)?.toList()?.elementAt(0)?.name ?? "" : "N/A"}",
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
                                        widget.patient.emergencyContactResponse
                                            .removeWhere((data) {
                                          return data.emergencyContactId ==
                                                  null &&
                                              (isBlank(data.firstName) ||
                                                  isBlank(data.lastName) ||
                                                  isBlank(data.contactNumber));
                                        });
                                        isEdit = true;
                                        selectedIndex = index;
                                        widget.bloc.dispatch(
                                            UpdateEmergencyContactListEvent(
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
          (selectedIndex < 0)
              ? InkWell(
                  onTap: () {
                    isEdit = false;
                    widget.patient.emergencyContactResponse
                        .add(EmergencyContactList(
                      patientId:
                          widget.patient.updatePatientContactRequest.patientId,
                    ));
                    selectedIndex =
                        (widget?.patient?.emergencyContactResponse?.length ??
                                0) -
                            1;
                    widget.bloc.dispatch(UpdateEmergencyContactListEvent(
                        patient: widget.patient));
                  },
                  child: Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        (totalItem > 0)
                            ? "Add Another Emergency Contact"
                            : "Add Emergency Contact",
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
