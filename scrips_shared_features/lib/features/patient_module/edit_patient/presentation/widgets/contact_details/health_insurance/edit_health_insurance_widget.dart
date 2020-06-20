import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/insurance_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';

class EditHealthInsuranceWidget extends StatefulWidget {
  final CreateEditPatientBloc bloc;
  final InsuranceList insuranceItem;
  final List<InsuranceList> insuranceItemList;
  final Function onSave;
  final Function onCancel;
  final Function onRemove;
  final List<Insurance> insuranceList;
  final bool isPrimary;
  final bool isEdit;
  @override
  _EditHealthInsuranceWidgetState createState() =>
      _EditHealthInsuranceWidgetState();
  EditHealthInsuranceWidget(
      {this.bloc,
      this.insuranceItemList,
      this.insuranceItem,
      this.onCancel,
      this.onRemove,
      this.onSave,
      this.isPrimary = false,
      this.isEdit,
      this.insuranceList});
}

class _EditHealthInsuranceWidgetState extends State<EditHealthInsuranceWidget> {
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
          height: 247,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: <Widget>[
                Space(
                  vertical: 25,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: BlocBuilder<CreateEditPatientBloc,
                          CreateEditPatientState>(
                        bloc: this.widget.bloc,
                        builder: (context, state) {
                          InsuranceList iData = this.widget.insuranceItem;
                          if (state is EnableSaveInsuranceState) {
                            iData = state.insurance;
                          }
                          return FieldAndLabel<DropdownMenuItem<String>>(
                            isMandatory: true,
                            fieldType: FieldType.DropDownList,
                            // TODO: Fix opening the dropdown list
                            listItems: ((widget?.insuranceList?.length ?? 0) >
                                    0)
                                ? widget.insuranceList
                                    .map((item) => DropdownMenuItem(
                                        value: item?.id ?? '',
                                        child: Text(
                                            item?.insuranceProvider1 ?? '')))
                                    .toList()
                                : null,
                            margin: EdgeInsets.all(0),
                            fieldValue: !isBlank(iData.insuranceProvider)
                                ? ((widget.insuranceList?.where((val) {
                                              return val?.id ==
                                                      iData.insuranceProvider ??
                                                  "";
                                            })?.toList())
                                                ?.length ??
                                            0) >
                                        0
                                    ? (widget?.insuranceList?.where((val) {
                                        return val?.id ==
                                                iData?.insuranceProvider ??
                                            "";
                                      })?.toList())
                                        ?.first
                                        ?.id
                                    : null
                                : null,
                            onChanged: (value, FieldAndLabelState state) {
                              widget.insuranceItem.insuranceProvider = value;
                              widget.bloc.add(EnableSaveInsuranceEvent(
                                  insurance: widget.insuranceItem));
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            fieldBackgroundColor: textFieldBGcolor,
                            fieldTextColor: regularTextColor,
                            labelTextStyle: defaultFieldLabelStyle(null, null),
                            labelValue: (widget.isPrimary)
                                ? "Primary Insurance provider".toUpperCase()
                                : "secondary Insurance provider".toUpperCase(),
                            placeholder: "Select provider",
                            axis: Axis.vertical,
                            enabled: true,
                            wrapWithRow: true,
                          );
                        },
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
                        fieldValue: widget.insuranceItem.policyNumber,
                        fieldType: FieldType.TextField,
                        labelTextStyle: defaultFieldLabelStyle(null, null),
                        labelValue: "Policy Number".toUpperCase(),
                        onChanged: (value, FieldAndLabelState state) {
                          if ((widget?.insuranceItemList?.length ?? 0) > 0) {
                            if ((widget.insuranceItemList
                                        ?.where((hlIns) =>
                                            (hlIns.policyNumber == value))
                                        ?.toList()
                                        ?.length ??
                                    0) >
                                0) {
                              widget.bloc.add(ShowErrorMessageEvent(
                                  message: "Health Insurance already added"));
                              widget.insuranceItem.policyNumber = value;
                            } else {
                              widget.insuranceItem.policyNumber = value;
                            }
                          } else {
                            widget.insuranceItem.policyNumber = value;
                          }

                          widget.bloc.add(EnableSaveInsuranceEvent(
                              insurance: widget.insuranceItem));
                        },
                        validationMessage: "",
                        placeholder: "Enter policy number",
                        axis: Axis.vertical,
                        enabled: true,
                      ),
                    ),
                  ],
                ),
                Space(
                  vertical: 26,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: BlocBuilder<CreateEditPatientBloc,
                          CreateEditPatientState>(
                        bloc: this.widget.bloc,
                        builder: (context, state) {
                          InsuranceList iData = this.widget.insuranceItem;
                          if (state is EnableSaveInsuranceState) {
                            iData = state.insurance;
                          }
                          return FieldAndLabel(
                            isMandatory: false,
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            fieldBackgroundColor: textFieldBGcolor,
                            fieldTextColor: textInputColor,
                            fieldType: FieldType.DatePicker,
                            icon: Images.instance.licenseExpirationDate(),
                            rightIcon: Images.instance.dropDownIcon(),
                            fieldValue: iData.eligiblityStartDate,
                            lastDate: DateTime.now(),
                            labelTextStyle: defaultFieldLabelStyle(null, null),
                            labelValue: "ELIGIBILITY START DATE",
                            onChanged: (value, FieldAndLabelState state) {
                              widget.insuranceItem.eligiblityStartDate = value;
                              widget.bloc.add(EnableSaveInsuranceEvent(
                                  insurance: widget.insuranceItem));
                            },
                            validationMessage: "",
                            placeholder: "Select date",
                            axis: Axis.vertical,
                            enabled: true,
                          );
                        },
                      ),
                    ),
                    Space(
                      horizontal: 40,
                    ),
                    Expanded(
                      child: BlocBuilder<CreateEditPatientBloc,
                          CreateEditPatientState>(
                        bloc: this.widget.bloc,
                        builder: (context, state) {
                          InsuranceList iData = this.widget.insuranceItem;
                          if (state is EnableSaveInsuranceState) {
                            iData = state.insurance;
                          }
                          return FieldAndLabel(
                            isMandatory: true,
                            margin: EdgeInsets.all(0),
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                            fieldBackgroundColor: textFieldBGcolor,
                            fieldTextColor: textInputColor,
                            fieldType: FieldType.DatePicker,
                            icon: Images.instance.licenseExpirationDate(),
                            rightIcon: Images.instance.dropDownIcon(),
                            fieldValue: iData.expirationDate,
                            firstDate: DateTime.now(),
                            labelTextStyle: defaultFieldLabelStyle(null, null),
                            labelValue: "EXPIRATION DATE",
                            onChanged: (value, FieldAndLabelState state) {
                              widget.insuranceItem.expirationDate = value;
                              widget.bloc.add(EnableSaveInsuranceEvent(
                                  insurance: widget.insuranceItem));
                            },
                            validationMessage: "",
                            placeholder: "Select date",
                            axis: Axis.vertical,
                            enabled: true,
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Space(
                  vertical: 24,
                ),
                Row(
                  children: <Widget>[
                    BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                      bloc: this.widget.bloc,
                      builder: (context, state) {
                        if (state is EnableSaveInsuranceState) {
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
                                  widget.onSave(widget.insuranceItem);
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
                            text: "Remove This Insurance",
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
