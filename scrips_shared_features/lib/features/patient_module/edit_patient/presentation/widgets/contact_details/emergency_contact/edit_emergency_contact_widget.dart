import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/resizable_cupertino_switch_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/emergency_contact_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';

class EditEmergencyContactWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final EmergencyContactList emergencyContactItem;
  final Function onSave;
  final Function onCancel;
  final Function onRemove;
  final List<Relationship> relationshipList;
  final List<EmergencyContactList> emergencyContactItemList;
  final bool isEdit;
  @override
  _EditEmergencyContactWidgetState createState() =>
      _EditEmergencyContactWidgetState();
  EditEmergencyContactWidget(
      {this.bloc,
      this.onSave,
      this.onCancel,
      this.onRemove,
      this.emergencyContactItemList,
      this.isEdit,
      this.relationshipList,
      this.emergencyContactItem});
}

class _EditEmergencyContactWidgetState
    extends State<EditEmergencyContactWidget> {
  bool enableSave = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 388.0 + 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                Space(
                  vertical: 25,
                ),
                BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                  bloc: this.widget.bloc,
                  builder: (context, state) {
                    EmergencyContactList eData =
                        this.widget.emergencyContactItem;
                    if (state is EnableSaveEmergencyContactState) {
                      eData = state.emergencyContact;
                    }
                    return FieldAndLabel<DropdownMenuItem<String>>(
                      isMandatory: false,
                      fieldType: FieldType.DropDownList,
                      // TODO: Fix opening the dropdown list
                      listItems: ((widget?.relationshipList?.length ?? 0) > 0)
                          ? widget.relationshipList
                              .map((item) => DropdownMenuItem(
                                  value: item?.id ?? '',
                                  child: Text(
                                      item?.name?.toLowerCase()?.capitalize() ??
                                          '')))
                              .toList()
                          : null,
                      margin: EdgeInsets.all(0),
                      fieldValue: !isBlank(eData.relationship)
                          ? ((widget.relationshipList?.where((val) {
                                        return val?.id == eData.relationship ??
                                            "";
                                      })?.toList())
                                          ?.length ??
                                      0) >
                                  0
                              ? (widget?.relationshipList?.where((val) {
                                  return val?.id == eData?.relationship ?? "";
                                })?.toList())
                                  ?.first
                                  ?.id
                              : null
                          : null,
                      onChanged: (value, FieldAndLabelState state) {
                        widget.emergencyContactItem.relationship = value;
                        widget.bloc.add(EnableSaveEmergencyContactEvent(
                            emergencyContact: widget.emergencyContactItem));
                      },
                      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      fieldBackgroundColor: textFieldBGcolor,
                      fieldTextColor: regularTextColor,
                      labelTextStyle: defaultFieldLabelStyle(null, null),
                      labelValue: "RELATIONSHIP".toUpperCase(),
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
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FieldAndLabel(
                        isMandatory: true,
                        margin: EdgeInsets.all(0),
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        fieldBackgroundColor: textFieldBGcolor,
                        fieldTextColor: textInputColor,
                        maxLength: 50,
                        fieldValue:
                            widget?.emergencyContactItem?.firstName ?? "",
                        fieldType: FieldType.TextField,
                        labelTextStyle: defaultFieldLabelStyle(null, null),
                        labelValue: "FIRST NAME".toUpperCase(),
                        onChanged: (value, FieldAndLabelState state) {
                          widget.emergencyContactItem.firstName = value;
                          widget.bloc.add(EnableSaveEmergencyContactEvent(
                              emergencyContact: widget.emergencyContactItem));
                        },
                        validationMessage: "",
                        placeholder: "Enter first name",
                        axis: Axis.vertical,
                        enabled: true,
                      ),
                    ),
                    Space(
                      horizontal: 40,
                    ),
                    Expanded(
                      child: FieldAndLabel(
                        isMandatory: true,
                        margin: EdgeInsets.all(0),
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        fieldBackgroundColor: textFieldBGcolor,
                        fieldTextColor: textInputColor,
                        maxLength: 50,
                        fieldValue:
                            widget?.emergencyContactItem?.lastName ?? "",
                        fieldType: FieldType.TextField,
                        labelTextStyle: defaultFieldLabelStyle(null, null),
                        labelValue: "LAST NAME".toUpperCase(),
                        onChanged: (value, FieldAndLabelState state) {
                          widget.emergencyContactItem.lastName = value;
                          widget.bloc.add(EnableSaveEmergencyContactEvent(
                              emergencyContact: widget.emergencyContactItem));
                        },
                        validationMessage: "",
                        placeholder: "Enter last name",
                        axis: Axis.vertical,
                        enabled: true,
                      ),
                    ),
                  ],
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
                  fieldType: FieldType.PhoneField,
                  country: null,
                  fieldValue: widget?.emergencyContactItem?.contactNumber ?? "",
                  labelTextStyle: defaultFieldLabelStyle(null, null),
                  labelValue: "CONTACT NUMBER".toUpperCase(),
                  maxLength: 20,
                  onChanged: (value, FieldAndLabelState state) {
                    if (state.currentValidationMessage.length > 0 &&
                        value.toString().length > 0) {
                      widget?.emergencyContactItem?.contactNumber = "";
                    } else {
                      if ((widget?.emergencyContactItemList?.length ?? 0) > 0) {
                        if ((widget.emergencyContactItemList
                                    ?.where((emgCon) =>
                                        emgCon.contactNumber.contains(value))
                                    ?.toList()
                                    ?.length ??
                                0) >
                            0) {
                          widget.bloc.add(ShowErrorMessageEvent(
                              message:
                                  "Emergency Contact Number already added"));
                          widget?.emergencyContactItem?.contactNumber = "";
                        } else {
                          widget?.emergencyContactItem?.contactNumber = value;
                        }
                      } else {
                        widget?.emergencyContactItem?.contactNumber = value;
                      }
                    }
                    widget.bloc.add(EnableSaveEmergencyContactEvent(
                        emergencyContact: widget.emergencyContactItem));
                  },
                  validationMessage: "",
                  placeholder: "e.g. +971 23 345 6789",
                  axis: Axis.vertical,
                  enabled: true,
                ),
                Space(
                  vertical: 16,
                ),
                Container(
                  height: 48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Make this contact proxy",
                        style: normalLabelTextStyle(17, regularTextColor),
                      ),
                      BlocBuilder<CreateEditPatientBloc,
                          CreateEditPatientState>(
                        bloc: this.widget.bloc,
                        builder: (context, state) {
                          EmergencyContactList eData =
                              this.widget.emergencyContactItem;
                          if (state is EnableSaveEmergencyContactState) {
                            eData = state.emergencyContact;
                          }
                          return SizedCupertinoSwitch(
                            width: 51,
                            height: 31,
                            value: eData?.isProxy ?? false,
                            onChanged: (status) {
                              widget.emergencyContactItem.isProxy = status;
                              widget.bloc.add(EnableSaveEmergencyContactEvent(
                                  emergencyContact:
                                      widget.emergencyContactItem));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Space(
                  vertical: 16,
                ),
                Row(
                  children: <Widget>[
                    BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                      bloc: this.widget.bloc,
                      builder: (context, state) {
                        if (state is EnableSaveEmergencyContactState) {
                          enableSave = state.status;
                        }
                        return Button(
                          height: 32,
                          width: 72,
                          buttonBackgroundColor: enableSave
                              ? enabledBtnBGColor
                              : disabledBtnBGColor,
                          style:
                              semiBoldLabelTextStyle(15, enabledBtnTextColor),
                          text: "Save",
                          onPressed: enableSave
                              ? () {
                                  widget.onSave(widget.emergencyContactItem);
                                }
                              : null,
                        );
                      },
                    ),
                    Space(
                      horizontal: 10,
                    ),
                    Button(
                      height: 32,
                      width: 72,
                      buttonBackgroundColor: bgColor,
                      style: semiBoldLabelTextStyle(15, enabledBtnBGColor),
                      text: "Cancel",
                      onPressed: () {
                        widget.onCancel();
                      },
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    (widget.isEdit)
                        ? Button(
                            height: 32,
                            width: 178,
                            buttonBackgroundColor: bgColor,
                            style: semiBoldLabelTextStyle(15, red),
                            text: "Remove This Contact",
                            onPressed: () {
                              widget.onRemove();
                            },
                          )
                        : Container(),
                  ],
                ),
                Space(
                  vertical: 24,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: separatorColor,
        )
      ],
    );
  }
}
