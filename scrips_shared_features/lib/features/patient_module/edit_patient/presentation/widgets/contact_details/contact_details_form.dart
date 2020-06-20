import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/ownership_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/generated/l10n.dart';
import 'package:validators/validators.dart';

class ContactDetailsFormWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Ownership> ownershipList;
  @override
  _ContactDetailsFormWidgetState createState() =>
      _ContactDetailsFormWidgetState();
  ContactDetailsFormWidget(
      {this.patient, this.isEdit, this.bloc, this.ownershipList});
}

class _ContactDetailsFormWidgetState extends State<ContactDetailsFormWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormView(
      header: "CONTACT DETAILS".toUpperCase(),
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
              return FieldAndLabel(
                isMandatory: true,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                fieldValue:
                    pData?.updatePatientContactRequest?.ownership ?? null,
                tagsItems: ((widget?.ownershipList?.length ?? 0) > 0)
                    ? widget.ownershipList
                        .map((item) => ValueDisplayPair(
                            value: item?.id ?? '',
                            label: item?.name?.trim() ?? ''))
                        .toList()
                    : null,
                fieldTextColor: textInputColor,
                fieldType: FieldType.SingleTagPicker,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "OWNERSHIP".toUpperCase(),
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.updatePatientContactRequest.ownership = value;
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
          Row(
            children: <Widget>[
              Expanded(
                child: FieldAndLabel(
                  isMandatory: false,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fieldBackgroundColor: textFieldBGcolor,
                  fieldType: FieldType.TextField,
                  labelTextStyle: defaultFieldLabelStyle(null, null),
                  labelValue: "EMAIL ADDRESS".toUpperCase(),
                  fieldValue:
                      widget?.patient?.updatePatientContactRequest?.email ?? "",
                  placeholder: "Enter email address",
                  maxLength: 100,
                  axis: Axis.vertical,
                  enabled: true,
                  onChanged: (value, FieldAndLabelState state) {
                    if (!isEmail(value)) {
                      widget.patient.updatePatientContactRequest.email = "";
                      state.setValidationMessage(
                          S.of(context).not_a_valid_email);
                    } else {
                      widget.patient.updatePatientContactRequest.email = value;
                      state.setValidationMessage('');
                    }
                    widget.bloc
                        .add(EnablePatientSaveEvent(patient: widget.patient));
                  },
                ),
              ),
              Space(
                horizontal: 18,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 18,
                  ),
                  BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                    bloc: this.widget.bloc,
                    builder: (context, state) {
                      Patient pData = this.widget.patient;
                      if (state is EnablePatientSaveState) {
                        pData = state.patient;
                      }
                      return InkWell(
                          onTap: () {
                            if (!isBlank(widget
                                .patient.updatePatientContactRequest.email)) {
                              widget.patient.updatePatientContactRequest
                                  .isPreferrable = 0;
                              widget.bloc.add(EnablePatientSaveEvent(
                                  patient: widget.patient));
                            }
                          },
                          child: ((pData?.updatePatientContactRequest
                                          ?.isPreferrable ??
                                      -1) ==
                                  0)
                              ? Images.instance.starIconFilled()
                              : Images.instance.starIcon());
                    },
                  ),
                ],
              )
            ],
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
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fieldBackgroundColor: textFieldBGcolor,
                  fieldTextColor: textInputColor,
                  fieldType: FieldType.PhoneField,
                  country: null,
                  fieldValue: widget?.patient?.updatePatientContactRequest
                          ?.primaryContact ??
                      "",
                  labelTextStyle: defaultFieldLabelStyle(null, null),
                  labelValue: "PRIMARY CONTACT NUMBER".toUpperCase(),
                  maxLength: 20,
                  onChanged: (value, FieldAndLabelState state) {
                    if (state.currentValidationMessage.length > 0 &&
                        value.toString().length > 0) {
                      widget.patient.updatePatientContactRequest
                          .primaryContact = "";
                    } else {
                      widget.patient.updatePatientContactRequest
                          .primaryContact = value;
                      print(
                          "Prefreable ${widget.patient.updatePatientContactRequest.isPreferrable}");
                      if ((widget?.patient?.updatePatientContactRequest?.isPreferrable ?? -1) < 0 ||
                          (widget?.patient?.updatePatientContactRequest
                                      ?.isPreferrable ??
                                  -1) >
                              2 ||
                          widget.patient.updatePatientContactRequest
                                  .isPreferrable ==
                              null) {
                        widget.patient.updatePatientContactRequest
                            .isPreferrable = 1;
                      }
                    }

                    widget.bloc
                        .add(EnablePatientSaveEvent(patient: widget.patient));
                  },
                  validationMessage: "",
                  placeholder: "e.g. +971 23 345 6789",
                  axis: Axis.vertical,
                  enabled: true,
                ),
              ),
              Space(
                horizontal: 18,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 18,
                  ),
                  BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                    bloc: this.widget.bloc,
                    builder: (context, state) {
                      Patient pData = this.widget.patient;
                      if (state is EnablePatientSaveState) {
                        pData = state.patient;
                      }
                      return InkWell(
                          onTap: () {
                            if (!isBlank(widget.patient
                                .updatePatientContactRequest.primaryContact)) {
                              widget.patient.updatePatientContactRequest
                                  .isPreferrable = 1;
                              widget.bloc.add(EnablePatientSaveEvent(
                                  patient: widget.patient));
                            }
                          },
                          child: ((pData?.updatePatientContactRequest
                                          ?.isPreferrable ??
                                      -1) ==
                                  1)
                              ? Images.instance.starIconFilled()
                              : Images.instance.starIcon());
                    },
                  ),
                ],
              )
            ],
          ),
          Space(
            vertical: 26,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: FieldAndLabel(
                  isMandatory: false,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  fieldBackgroundColor: textFieldBGcolor,
                  fieldTextColor: textInputColor,
                  fieldType: FieldType.PhoneField,
                  country: null,
                  fieldValue: widget?.patient?.updatePatientContactRequest
                          ?.secondayContact ??
                      "",
                  labelTextStyle: defaultFieldLabelStyle(null, null),
                  labelValue: "SECONDARY CONTACT NUMBER".toUpperCase(),
                  maxLength: 20,
                  onChanged: (value, FieldAndLabelState state) {
                    if (state.currentValidationMessage.length > 0 &&
                        value.toString().length > 0) {
                      widget.patient.updatePatientContactRequest
                          .secondayContact = "";
                    } else {
                      if ((widget?.patient?.updatePatientContactRequest
                                  ?.primaryContact ??
                              "") ==
                          value) {
                        widget.patient.updatePatientContactRequest
                            .secondayContact = "";
                        state.setValidationMessage(
                            "Phone number already used as primary contact");
                      } else {
                        widget.patient.updatePatientContactRequest
                            .secondayContact = value;
                      }
                    }
                    widget.bloc
                        .add(EnablePatientSaveEvent(patient: widget.patient));
                  },
                  validationMessage: "",
                  placeholder: "e.g. +971 23 345 6789",
                  axis: Axis.vertical,
                  enabled: true,
                ),
              ),
              Space(
                horizontal: 18,
              ),
              Column(
                children: <Widget>[
                  Container(
                    height: 18,
                  ),
                  BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
                    bloc: this.widget.bloc,
                    builder: (context, state) {
                      Patient pData = this.widget.patient;
                      if (state is EnablePatientSaveState) {
                        pData = state.patient;
                      }
                      return InkWell(
                          onTap: () {
                            if (!isBlank(widget.patient
                                .updatePatientContactRequest.secondayContact)) {
                              widget.patient.updatePatientContactRequest
                                  .isPreferrable = 2;
                              widget.bloc.add(EnablePatientSaveEvent(
                                  patient: widget.patient));
                            }
                          },
                          child: ((pData?.updatePatientContactRequest
                                          ?.isPreferrable ??
                                      -1) ==
                                  2)
                              ? Images.instance.starIconFilled()
                              : Images.instance.starIcon());
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
