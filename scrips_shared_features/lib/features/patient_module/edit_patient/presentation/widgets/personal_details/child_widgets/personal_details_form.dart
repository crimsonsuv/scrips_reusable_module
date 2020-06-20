import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/field_and_label.dart';
import 'package:scrips_core/widgets/general/form_view_widget.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/core/constants/api_constats.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/gender_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/language_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/maritial_status_model.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/fetch_language_valueset_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/data/datamodels/patients_model.dart';
import 'package:scrips_shared_features/features/patient_module/edit_patient/presentation/bloc/bloc.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class PersonalDetailsFormWidget extends StatefulWidget {
  final bool isEdit;
  final CreateEditPatientBloc bloc;
  final Patient patient;
  final List<Gender> genderList;
  final List<MaritalStatus> maritalStatusList;
  final List<LanguageValueSetList> languageList;
  @override
  _PersonalDetailsFormWidgetState createState() =>
      _PersonalDetailsFormWidgetState();
  PersonalDetailsFormWidget(
      {this.isEdit,
      this.patient,
      this.bloc,
      this.languageList,
      this.maritalStatusList,
      this.genderList});
}

class _PersonalDetailsFormWidgetState extends State<PersonalDetailsFormWidget> {
  bool imageUploading = false;
  FetchLanguageValueSetUseCase fetchLanguageValueSetUseCase;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLanguageValueSetUseCase =
        FetchLanguageValueSetUseCase(repository: sl());
  }

  void pickImage() async {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';
    input.onChange.listen((e) {
      if (input.files.isEmpty) return;
      final reader = html.FileReader();
      reader.readAsDataUrl(input.files[0]);
      reader.onError.listen((err) => setState(() {
            print("$err");
          }));
      reader.onLoad.first.then((res) async {
        final encoded = reader.result as String;
        final stripped =
            encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
        final Uint8List data = base64.decode(stripped);
        widget.bloc.add(UploadImageEvent(path: encoded));
      });
    });
    input.click();
  }

  @override
  Widget build(BuildContext context) {
    return FormView(
      header: "PERSONAL DETAILS".toUpperCase(),
      margin: EdgeInsets.symmetric(horizontal: 32, vertical: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("PATIENT PHOTO",
                style: boldLabelTextStyle(12.0, labelTextStyleTextColor)),
          ),
          Space(
            vertical: 8,
          ),
          BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
            bloc: this.widget.bloc,
            builder: (context, state) {
              Patient pData = this.widget.patient;
              if (state is EnablePatientSaveState) {
                pData = state.patient;
              } else if (state is UploadingImageBeginState) {
                imageUploading = true;
              } else if (state is UploadingImageEndState) {
                imageUploading = false;
              } else if (state is ImageUploadedState) {
                imageUploading = false;
                widget.patient.photoUrl = state.link;
//                widget.bloc
//                    .add(EnablePatientSaveEvent(patient: widget.patient));
              }
              return ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: gradientColor2,
                  ),
                  child: (imageUploading)
                      ? Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    enabledBtnBGColor),
                              )),
                        )
                      : Center(
                          child: InkWell(
                              onTap: () async {
                                if (kIsWeb) {
                                  // pickImage();
                                } else {
                                  ImagePicker.pickImage(
                                          source: ImageSource.gallery,
                                          imageQuality: 80)
                                      .then((file) {
                                    widget.bloc
                                        .add(UploadImageEvent(path: file.path));
                                  });
                                }
                              },
                              child: (!widget.isEdit ||
                                      pData?.photoUrl == "" ||
                                      pData?.photoUrl == null)
                                  ? Images.instance
                                      .cameraIcon(height: 30, width: 30)
                                  : Image.network(
                                      patientsServer + pData.photoUrl,
                                      fit: BoxFit.fill,
                                      height: 80,
                                      width: 80,
                                    )),
                        ),
                ),
              );
            },
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
            maxLength: 50,
            fieldValue: widget?.patient?.firstName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "FIRST NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.firstName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter first name",
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
            maxLength: 50,
            fieldValue: widget?.patient?.middleName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "MIDDLE NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.middleName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter middle name (Optional)",
            axis: Axis.vertical,
            enabled: true,
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
            maxLength: 50,
            fieldValue: widget?.patient?.lastName ?? "",
            fieldType: FieldType.TextField,
            labelTextStyle: defaultFieldLabelStyle(null, null),
            labelValue: "LAST NAME".toUpperCase(),
            onChanged: (value, FieldAndLabelState state) {
              widget.patient.lastName = value;
              widget.bloc.add(EnablePatientSaveEvent(patient: widget.patient));
            },
            validationMessage: "",
            placeholder: "Enter last name",
            axis: Axis.vertical,
            enabled: true,
          ),
          Space(
            vertical: 26,
          ),
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
                fieldTextColor: textInputColor,
                fieldType: FieldType.DatePicker,
                icon: Images.instance.licenseExpirationDate(),
                rightIcon: Images.instance.dropDownIcon(),
                fieldValue: pData?.birthDate,
                firstDate: (widget?.patient?.isAdult ?? true)
                    ? null
                    : DateTime.now().subtract(Duration(days: 365 * 18)),
                lastDate: (widget?.patient?.isAdult ?? true)
                    ? DateTime.now().subtract(Duration(days: 365 * 18 + 1))
                    : DateTime.now(),
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "DATE OF BIRTH",
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.birthDate = value;
                  widget.bloc
                      .add(EnablePatientSaveEvent(patient: widget.patient));
                },
                validationMessage: "",
                placeholder: "Select date of birth",
                axis: Axis.vertical,
                enabled: true,
              );
            },
          ),
          Space(
            vertical: 26,
          ),
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
                fieldValue: pData?.gender ?? null,
                tagsItems: ((widget?.genderList?.length ?? 0) > 0)
                    ? widget.genderList
                        .map((item) => ValueDisplayPair(
                            value: item?.id ?? '',
                            label: item?.gender?.trim() ?? ''))
                        .toList()
                    : null,
                fieldTextColor: textInputColor,
                fieldType: FieldType.SingleTagPicker,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "GENDER".toUpperCase(),
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.gender = value;
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
          BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
            bloc: this.widget.bloc,
            builder: (context, state) {
              Patient pData = this.widget.patient;
              if (state is EnablePatientSaveState) {
                pData = state.patient;
              }
              return FieldAndLabel(
                isMandatory: false,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                fieldValue: pData?.maritalStatus ?? null,
                tagsItems: ((widget?.maritalStatusList?.length ?? 0) > 0)
                    ? widget.maritalStatusList
                        .map((item) => ValueDisplayPair(
                            value: item?.id ?? '',
                            label: item?.name?.trim() ?? ''))
                        .toList()
                    : null,
                fieldTextColor: textInputColor,
                fieldType: FieldType.SingleTagPicker,
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "Marital status".toUpperCase(),
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.maritalStatus = value;
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
          BlocBuilder<CreateEditPatientBloc, CreateEditPatientState>(
            bloc: this.widget.bloc,
            builder: (context, state) {
              Patient pData = this.widget.patient;
              if (state is EnablePatientSaveState) {
                pData = state.patient;
              }
              return FieldAndLabel(
                isMandatory: false,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                fieldBackgroundColor: textFieldBGcolor,
                listItems: ((widget?.languageList?.length ?? 0) > 0)
                    ? (widget.languageList
                        .map((item) => DropdownMenuItem(
                            value: item.languageId,
                            child: Text(item.code.displayName)))
                        .toList())
                    : null,
                fieldValue: pData?.language == null
                    ? null
                    : (widget?.languageList
                                    ?.where((data) =>
                                        data.languageId ==
                                        widget?.patient?.language)
                                    ?.toList()
                                    ?.length ??
                                0) >
                            0
                        ? widget?.patient?.language
                        : null,
                fieldTextColor: textInputColor,
                fieldType: FieldType.DropDownList,
                placeholder: "Select language",
                labelTextStyle: defaultFieldLabelStyle(null, null),
                labelValue: "Preferred Language".toUpperCase(),
                onChanged: (value, FieldAndLabelState state) {
                  widget.patient.language = value;
                  widget.bloc
                      .add(EnablePatientSaveEvent(patient: widget.patient));
                },
                validationMessage: "",
                axis: Axis.vertical,
                enabled: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
