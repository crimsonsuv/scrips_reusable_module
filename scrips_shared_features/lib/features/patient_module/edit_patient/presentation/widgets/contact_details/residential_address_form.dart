import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';

class ResidentialAddressFormWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  @override
  _ResidentialAddressFormWidgetState createState() =>
      _ResidentialAddressFormWidgetState();
  ResidentialAddressFormWidget({this.bloc, this.isEdit, this.patient});
}

class _ResidentialAddressFormWidgetState
    extends State<ResidentialAddressFormWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormView(
      header: "RESIDENTIAL ADDRESS".toUpperCase(),
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
              return Column(
                children: <Widget>[
                  FieldAndLabel(
                    isMandatory: false,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    fieldBackgroundColor: textFieldBGcolor,
                    rightIcon: Images.instance.location(),
                    fieldTextColor: textInputColor,
                    locationType: LocationType.Address,
                    fieldType: FieldType.LocationPicker,
                    fieldValue:
                        widget?.patient?.updatePatientContactRequest?.address ??
                            "",
                    labelTextStyle: defaultFieldLabelStyle(null, null),
                    labelValue: "Address".toUpperCase(),
                    onChanged: (value, FieldAndLabelState state) {
                      Prediction data = value as Prediction;
                      widget?.patient?.updatePatientContactRequest?.address =
                          data?.structuredFormatting?.mainText ?? "";
                      if ((data?.terms?.length ?? 0) > 0) {
                        widget?.patient?.updatePatientContactRequest?.city =
                            data.terms[data.terms.length - 2].value;
                        widget?.patient?.updatePatientContactRequest?.country =
                            data.terms[data.terms.length - 1].value;
                      } else {
                        widget?.patient?.updatePatientContactRequest?.city = "";
                        widget?.patient?.updatePatientContactRequest?.country =
                            "";
                      }
                      widget.bloc.add(
                          EnablePatientSaveEvent(patient: widget?.patient));
                    },
                    validationMessage: "",
                    placeholder: "Enter address",
                    axis: Axis.vertical,
                    enabled: true,
                  ),
                  Space(
                    vertical: 26,
                  ),
                  FieldAndLabel(
                    isMandatory: false,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    fieldBackgroundColor: textFieldBGcolor,
                    fieldTextColor: textInputColor,
                    fieldType: FieldType.TextField,
                    fieldValue: pData?.updatePatientContactRequest?.city ?? "",
                    labelTextStyle: defaultFieldLabelStyle(null, null),
                    labelValue: "CITY".toUpperCase(),
                    placeholder: "Enter city",
                    axis: Axis.vertical,
                    enabled: false,
                    validationMessage: "",
                  ),
                  Space(
                    vertical: 26,
                  ),
                  FieldAndLabel(
                    isMandatory: false,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    fieldBackgroundColor: textFieldBGcolor,
                    fieldTextColor: textInputColor,
                    fieldType: FieldType.TextField,
                    fieldValue:
                        pData?.updatePatientContactRequest?.country ?? "",
                    labelTextStyle: defaultFieldLabelStyle(null, null),
                    labelValue: "Country".toUpperCase(),
                    placeholder: "Enter country",
                    validationMessage: "",
                    axis: Axis.vertical,
                    enabled: false,
                  ),
                ],
              );
            },
          ),
          Space(
            vertical: 26,
          ),
          FieldAndLabel(
            isMandatory: false,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            fieldBackgroundColor: textFieldBGcolor,
            fieldTextColor: textInputColor,
            fieldType: FieldType.TextField,
            maxLength: 20,
            fieldValue:
                widget?.patient?.updatePatientContactRequest?.building ?? "",
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "Building".toUpperCase(),
            placeholder: "Enter building number",
            onChanged: (value, FieldAndLabelState state) {
              widget?.patient?.updatePatientContactRequest?.building = value;
            },
            validationMessage: "",
            axis: Axis.vertical,
            enabled: true,
          ),
          Space(
            vertical: 26,
          ),
          FieldAndLabel(
            isMandatory: false,
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            fieldBackgroundColor: textFieldBGcolor,
            fieldTextColor: textInputColor,
            fieldType: FieldType.TextField,
            maxLength: 20,
            fieldValue:
                widget?.patient?.updatePatientContactRequest?.apartment ?? "",
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "Apartment".toUpperCase(),
            placeholder: "Enter apartment number",
            onChanged: (value, FieldAndLabelState state) {
              widget?.patient?.updatePatientContactRequest?.apartment = value;
            },
            validationMessage: "",
            axis: Axis.vertical,
            enabled: true,
          ),
        ],
      ),
    );
  }
}
