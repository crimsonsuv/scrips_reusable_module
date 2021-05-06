import 'dart:async';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead_web/flutter_typeahead.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_placeid_use_case.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_query_use_case.dart';
import 'package:scrips_core/common/domain/usecases/fetch_value_sets_use_case.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/common/domain/usecases/verify_phone_use_case.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/di/dependency_injection.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/app_locale.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/circle_image.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/stepper_widget.dart';
import 'package:scrips_shared_features/features/billing_module/data/datamodels/billing_service_model.dart';
import 'package:scrips_shared_features/features/billing_module/data/datamodels/provider_service_fee_model.dart';
import 'package:scrips_shared_features/features/billing_module/domain/usecases/provider_fees_use_cases/fetch_provider_services_use_case.dart';
import 'package:scrips_shared_features/features/billing_module/domain/usecases/services_use_cases/fetch_services_use_case.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/allergies_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/appointment_value_sets_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/diagnosis_code_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/flag_list_response.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/hospital_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/medical_schools_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/relationship_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/speciality_valueset_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/symptoms_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/vaccination_code_model.dart';
import 'package:scrips_shared_features/features/common/domain/usecases/flag_list_use_case.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/data/datamodels/patients_list_model.dart';
import 'package:scrips_shared_features/features/patient_module/patient_list/domain/usecases/fetch_patients_use_case.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

import 'date_text_formatter.dart';
import 'dropdown_view_widget.dart';

enum FieldType {
  TextField,
  DropDownList,
  SelectTagField,
  List,
  RichText,
  RichTextEdit,
  DatePicker,
  TimePicker,
  DateRangePicker,
  LocationPicker,
  PhoneField,
  SingleTagPicker,
  SearchSingleTagPicker,
  MultiTagPicker,
  ValueSetPicker,
  SearchPicker,
  ColorPicker,
  StepperField,
  Label
}

enum LocationType {
  Establishment,
  Address,
}

class FieldAndLabel<ListItemType> extends StatefulWidget {
  final FieldType fieldType;
  final GlobalKey gKey;
  final Color labelTextColor;
  final TextStyle labelTextStyle;
  final TextStyle labelValueTextStyle;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  final String labelValue;
  final dynamic fieldValue;
  String country;
  Country countryCode = CountryPickerUtils.getCountryByIsoCode("AE");
  final bool enabled;
  final double width;
  final double height;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isPassword;
  final bool isMandatory;
  final bool wrapWithRow;
  final bool autoFocus;
  final double spaceBetweenTitle;
  final String placeholder;
  final String validationMessage;
  final TextCapitalization labelTextCapitalization;
  final Function onChanged;
  final Function onEditingComplete;
  final Function onSubmitted;
  final Function onTap;
  final Function onIncrement;
  final Function onDecrement;
  final Widget icon;
  final Widget rightIcon;
  final int maxLength;
  FocusNode focusNode;
  final LocationType locationType;
  DateTime firstDate;
  DateTime lastDate;
  final List<ListItemType> listItems;
  final List<ValueDisplayPair> tagsItems;
  final List<ColorCodePair> colorItems;
  final String valueSetGroup;
  final dynamic useCase;
  final dynamic useCaseParam;
  FieldAndLabelState _myState;
  final AxisDirection direction;
  final TextInputType inputType;
  final List<TextInputFormatter> textInputFormatter;
  final String okText;
  final String cancelText;

  //
  FieldAndLabel(
      {Key key,
      this.gKey,
      this.labelValue,
      this.labelTextCapitalization = TextCapitalization.characters,
      this.labelTextStyle,
      this.labelValueTextStyle,
      this.country,
      this.fieldValue,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.firstDate,
      this.lastDate,
      this.onTap,
      this.fieldType = FieldType.TextField,
      this.listItems,
      this.tagsItems,
      this.colorItems,
      this.icon,
      this.focusNode,
      this.autoFocus = false,
      this.axis,
      this.enabled = true,
      this.boxDecoration,
      this.padding,
      this.margin,
      this.placeholder,
      this.validationMessage,
      this.spaceBetweenTitle,
      this.isPassword = false,
      this.isMandatory = false,
      this.width,
      this.labelTextColor,
      this.labelBackgroundColor,
      this.fieldBackgroundColor,
      this.fieldTextColor,
      this.rightIcon,
      this.onIncrement,
      this.onDecrement,
      this.locationType = LocationType.Establishment,
      this.maxLength = 300,
      this.height = 36,
      this.valueSetGroup,
      this.useCase,
      this.useCaseParam,
      this.okText = "Ok",
      this.cancelText = "Cancel",
      this.direction = AxisDirection.down,
      this.wrapWithRow = true,
      this.inputType = TextInputType.text,
      this.textInputFormatter})
      : super(key: key ?? UniqueKey());

  //  _TextViewAndLabelState state;

  //
  @override
  FieldAndLabelState createState() {
    _myState = FieldAndLabelState();
    return _myState;
  }

  FieldAndLabelState getState() {
    return _myState;
  }
}

class FieldAndLabelState extends State<FieldAndLabel> {
  //
  var currentFieldValue;
  String currentPlaceholder;
  String currentValidationMessage;
  TextEditingController _textEditController;
  FetchLocationsByQueryUseCase fetchLocationsByQueryUseCase;
  FetchLocationsByPlaceIdUseCase fetchLocationsByPlaceIdUseCase;
  VerifyPhoneUseCase verifyPhoneUseCase;
  Timer _debounce;
  FetchValueSetsUseCase fetchValueSetsUseCase;

  //  ZefyrController _richTextEditController;
  //  FocusNode _richTextEditFocusNode;

  void initState() {
    super.initState();
    fetchLocationsByQueryUseCase = FetchLocationsByQueryUseCase(repository: coreSl());
    fetchLocationsByPlaceIdUseCase = FetchLocationsByPlaceIdUseCase(repository: coreSl());
    fetchValueSetsUseCase = FetchValueSetsUseCase(repository: coreSl());
    if (widget.focusNode == null) widget.focusNode = new FocusNode();
    verifyPhoneUseCase = VerifyPhoneUseCase(repository: coreSl());
    currentFieldValue = widget.fieldValue ?? null;

    if (widget.fieldType == FieldType.TextField ||
        widget.fieldType == FieldType.LocationPicker ||
        widget.fieldType == FieldType.ValueSetPicker ||
        widget.fieldType == FieldType.SearchPicker ||
        widget.fieldType == FieldType.StepperField) {
      _textEditController = TextEditingController(text: currentFieldValue);
    } else if (widget.fieldType == FieldType.RichTextEdit) {
      _textEditController = TextEditingController(text: currentFieldValue);
    } else if (widget.fieldType == FieldType.DateRangePicker) {
      List<DateTime> dates;
      if ((currentFieldValue ?? widget.fieldValue) is List<DateTime>) {
        dates = currentFieldValue;
      } else {
        dates = [];
      }
      if (dates.length > 1) {
        _textEditController = TextEditingController(
            text: "${scDateFormat(dates.elementAt(0))} - ${scDateFormat(dates.elementAt(1)) ?? "NA"}");
      } else if (dates.length == 1) {
        _textEditController = TextEditingController(text: scDateFormat(dates.elementAt(0)));
      } else {
        _textEditController = TextEditingController(text: "");
      }
    } else if (widget.fieldType == FieldType.DatePicker) {
      _textEditController = TextEditingController(text: scDateFormat(currentFieldValue, format: "dd/MM/yyyy"));
    } else if (widget.fieldType == FieldType.TimePicker) {
      var text = "";
      if (currentFieldValue != null && currentFieldValue is TimeOfDay) {
        text = scTimeFormatTimeOfDay(currentFieldValue);
      }
      _textEditController = TextEditingController(text: text);
    } else if (widget.fieldType == FieldType.PhoneField) {
      if (currentFieldValue != null) {
        currentFieldValue = widget.fieldValue.replaceAll("+", "");
      }
      String phone = currentFieldValue as String;
      if (phone != null) {
        if ((phone ?? "").contains("-")) {
          widget.countryCode = CountryPickerUtils.getCountryByPhoneCode(phone.trim().split("-").first);
        }
        phone = phone.replaceAll("${phone.split("-").first}-", "");
        if (phone.startsWith("971")) {
          phone = phone.replaceAll("971", "");
        }
        if (phone.startsWith("91")) {
          phone = phone.replaceAll("91", "");
        }
      }
      _textEditController = TextEditingController(text: phone);
    } else if (widget.fieldType == FieldType.SelectTagField) {
      _textEditController = TextEditingController(text: currentFieldValue);
    }
  }

  onChangedInternal(value) async {
    if (widget.onChanged != null) {
      if (widget.fieldType == FieldType.PhoneField) {
        currentFieldValue = value;
        if (value.toString().length == 0) {
          setValidationMessage("");
          widget.onChanged("${widget.countryCode.phoneCode}-$value", this);
        } else {
          if (value.toString().length < 8) {
            setValidationMessage("Please, provide a valid number");
          } else {
            setValidationMessage("validating phone..");
            if (_debounce?.isActive ?? false) _debounce.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () async {
              final result = await verifyPhoneUseCase(
                  VerifyPhoneParams(phone: "+${widget.countryCode.phoneCode}-$value", country: widget.country));
              result.fold((error) {
                if (currentFieldValue.toString().length > 0) {
                  setValidationMessage(error.message);
                  widget.onChanged("+${widget.countryCode.phoneCode}-$value", this);
                } else {
                  setValidationMessage("");
                  widget.onChanged("", this);
                }
              }, (success) {
                setValidationMessage("");
                widget.onChanged("+${widget.countryCode.phoneCode}-$value", this);
              });
            });
          }
        }
      } else if (widget.fieldType == FieldType.DatePicker) {
        if (value.toString().length <= 10) {
          if (scDateParsing(value, format: 'dd/MM/yyyy') == 1) {
            setValidationMessage("Date format should be dd/MM/yyyy");
          } else if (scDateParsing(value, format: 'dd/MM/yyyy') == 0) {
            setValidationMessage("Please Enter Valid Date");
          } else {
            currentFieldValue = scDate(value, format: 'dd/MM/yyyy');
            if (currentFieldValue.isAfter(widget.lastDate)) {
              print("currentFieldValue-->$currentFieldValue");
              print("lastDate-->${widget.lastDate}");

              setValidationMessage("Date must be before ${scDateTimeFormat(widget.lastDate, format: 'dd/MM/yyyy')}");
            } else if (currentFieldValue.isBefore(widget.firstDate)) {
              print("currentFieldValue-->$currentFieldValue");
              print("firstDate-->${widget.firstDate}");

              setValidationMessage("Date must be after ${scDateTimeFormat(widget.firstDate, format: 'dd/MM/yyyy')}");
            } else {
              setValidationMessage("");
              widget.onChanged(currentFieldValue, this);
            }
          }
        } else if (value.toString().length >= 10) {
          widget.onChanged(value, this);
        }
      } else {
        currentFieldValue = value;
        widget.onChanged(value, this);
      }
    }
  }

  onSubmitted(value) {
    if (widget.onSubmitted != null) {
      // also pass this so UI can call methods such as setValidationMessage
      widget.onSubmitted(value, this);
    }
  }

  onEditingComplete() {
    if (widget.onEditingComplete != null) {
      // also pass this so UI can call methods such as setValidationMessage
      widget.onEditingComplete(this.currentFieldValue, this);
    }
  }

  onTapInternal() {
    if (widget.onTap != null) {
      // also pass this so UI can call methods such as setValidationMessage
      widget.onTap(this._textEditController);
    }
  }

  setValidationMessage(value) {
    debugLog(value);
    setState(() {
      currentValidationMessage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.wrapWithRow ?? true)
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          buildContents(context),
        ],
      );
    else
      return buildContents(context);
  }

  Widget buildContents(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: Expanded(
        child: Container(
          padding: widget.padding ?? UIHelper.defaultFieldAndLabelPadding,
          margin: widget.margin ?? UIHelper.defaultFieldAndLabelMargin,
          decoration: widget.boxDecoration ?? UIHelper.defaultFieldAndLabelBorder,
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
            buildLabel(context),
            buildField(context),
            buildValidationMessage(context),
          ]),
        ),
      ),
    );
  }

  Widget buildLabel(BuildContext context) {
    if (widget.labelValue != null && widget.labelValue.isNotEmpty)
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: UIHelper.defaultLabelBoxDecoration(widget.labelBackgroundColor),
            child: Row(children: <Widget>[
              Text(
                widget.labelValue,
                style:
                    this.widget.labelTextStyle ?? defaultLabelStyle(widget.labelTextColor, widget.labelBackgroundColor),
                textAlign: TextAlign.start,
//                textCapitalization: this.widget.labelTextCapitalization ??
//                    TextCapitalization.characters,
              ),
              this.widget.isMandatory
                  ? SizedBox(
                      width: UIHelper.defaultFieldAndLabelPaddingSize / 2,
                    )
                  : Container(),
              this.widget.isMandatory
                  ? Text(
                      '*',
                      style: this.widget.labelTextStyle.copyWith(color: defaultValidationTextColor) ??
                          defaultLabelStyle(widget.labelTextColor, Colors.transparent)
                              .copyWith(color: defaultValidationTextColor),
                      textAlign: TextAlign.start,
                    )
                  : Container(),
            ]),
          ),
          SizedBox(
            height: UIHelper.defaultFieldAndLabelPaddingSize / 2,
          )
        ],
      );
    else {
      return Container();
    }
  }

  Widget buildField(BuildContext context) {
    Widget field;
    switch (widget.fieldType) {
      case FieldType.TextField:
        field = buildTextField(context);
        break;
      case FieldType.RichText:
        field = buildRichText(context);
        break;
      case FieldType.SelectTagField:
        field = buildTextTagField(context);
        break;
      case FieldType.RichTextEdit:
        field = buildRichTextEdit(context);
        break;
      case FieldType.DropDownList:
        field = buildDropDownList(context);
        break;
      case FieldType.DatePicker:
        field = buildDatePickerField(context);
        break;
      case FieldType.TimePicker:
        field = buildTimePickerField(context);
        break;
      case FieldType.DateRangePicker:
        field = buildDateRangePickerField(context);
        break;
      case FieldType.LocationPicker:
        field = buildLocationPicker(context);
        break;
      case FieldType.ValueSetPicker:
        field = buildSearchValueSetsPicker(context);
        break;
      case FieldType.SearchPicker:
        field = buildSearchPicker(context);
        break;
      case FieldType.PhoneField:
        field = buildPhoneField(context);
        return ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
              color: widget.fieldBackgroundColor,
            ),
            child: Center(child: field),
          ),
        );
        break;
      case FieldType.SingleTagPicker:
        field = buildSingleTagPicker(context);
        break;
      case FieldType.SearchSingleTagPicker:
        field = buildSearchSingleTagPicker(context);
        break;
      case FieldType.MultiTagPicker:
        field = buildMultiTagPicker(context);
        break;
      case FieldType.ColorPicker:
        field = buildColorPicker(context);
        break;
      case FieldType.StepperField:
        field = buildStepperField(context);
        break;
      case FieldType.Label:
        field = buildLabelField(context);
        break;
      default:
        field = Container();
        break;
    }
    return Container(
      padding: (widget.fieldType == FieldType.SingleTagPicker ||
              widget.fieldType == FieldType.MultiTagPicker ||
              widget.fieldType == FieldType.ColorPicker ||
              widget.fieldType == FieldType.StepperField ||
              widget.fieldType == FieldType.Label)
          ? EdgeInsets.symmetric(horizontal: 0)
          : EdgeInsets.symmetric(horizontal: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: (widget.fieldType == FieldType.SingleTagPicker ||
                widget.fieldType == FieldType.MultiTagPicker ||
                widget.fieldType == FieldType.ColorPicker ||
                widget.fieldType == FieldType.StepperField ||
                widget.fieldType == FieldType.Label)
            ? null
            : Border.all(color: widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
        color: (widget.fieldType == FieldType.SingleTagPicker ||
                widget.fieldType == FieldType.MultiTagPicker ||
                widget.fieldType == FieldType.ColorPicker ||
                widget.fieldType == FieldType.StepperField ||
                widget.fieldType == FieldType.Label)
            ? Colors.transparent
            : widget.fieldBackgroundColor,
      ),
      child: (widget.fieldType == FieldType.Label)
          ? field
          : Center(
              // child: (widget.fieldType == FieldType.RichTextEdit ||
              //         widget.fieldType == FieldType.TextField ||
              //         widget.fieldType == FieldType.PhoneField ||
              //         widget.fieldType == FieldType.SearchPicker ||
              //         widget.fieldType == FieldType.LocationPicker ||
              //         widget.fieldType == FieldType.LocationPicker)
              //     ? RawKeyboardListener(
              //         focusNode: widget.focusNode ?? FocusNode(),
              //         autofocus: true,
              //         onKey: (key) {
              //           if (kIsWeb && widget.focusNode.hasPrimaryFocus) {
              //             var kData = key.data;
              //             print("BUTTON CLICKED ${kData.physicalKey.usbHidUsage}");
              //             if (kReleaseMode) {
              //               if (kData.physicalKey.usbHidUsage == 458795) {
              //                 context.nextEditableTextFocus();
              //               }
              //             } else {
              //               if (kData.physicalKey.debugName == "Tab") {
              //                 context.nextEditableTextFocus();
              //               }
              //             }
              //           }
              //         },
              //         child: field,
              //       )
              //     :
              child: field),
    );
  }

  Widget buildValidationMessage(BuildContext context) {
    return UIHelper.buildValidationMessage(context,
        validationMessage: currentValidationMessage ?? widget.validationMessage ?? null);
  }

  Widget buildDropDownList(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 36),
      height: 36.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: IgnorePointer(
              ignoring: !(widget?.enabled ?? true),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                value: currentFieldValue ?? widget.fieldValue,
                items: widget.listItems ?? [],
                icon: Images.instance.dropDownIcon(height: 24, width: 24),
                iconSize: 12.0,
                onChanged: onChangedInternal,
                style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                hint: Text(widget.placeholder ?? '', style: defaultHintStyle(null, null)),
                disabledHint: Text(widget.validationMessage ?? '', style: defaultHintStyle(null, null)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextTagField(BuildContext context) {
    return RawKeyboardListener(
      focusNode: widget.focusNode,
      autofocus: true,
      onKey: (key) {
        print("BUTTON CLICKED main${key.data.physicalKey.usbHidUsage}");
        if (kIsWeb) {
          var kData = key.data;
          print("BUTTON CLICKED ${kData.physicalKey.usbHidUsage}");
          if (kReleaseMode) {
            if (kData.physicalKey.usbHidUsage == 458795) {
              context.nextEditableTextFocus();
            }
            if (kData.physicalKey.usbHidUsage == 458792 || kData.physicalKey.usbHidUsage == 458979) {
              if (currentFieldValue.toString().isNotEmpty) {
                print("currentFieldValue-->${currentFieldValue}");
                onSubmitted(currentFieldValue);
                currentFieldValue = "";

                _textEditController.clear();
                widget.focusNode.requestFocus();
              }
            }
          } else {
            if (kData.physicalKey.debugName == "Tab") {
              context.nextEditableTextFocus();
            }
            if (kData.physicalKey.debugName == "Enter" || kData.physicalKey.debugName == "numpadEnter") {
              if (currentFieldValue.toString().isNotEmpty) {
                print("currentFieldValue-->${currentFieldValue}");
                onSubmitted(currentFieldValue);
                currentFieldValue = "";

                _textEditController.clear();
                widget.focusNode.requestFocus();
              }
            }
          }
        }
      },
      child: SizedBox(
        height: widget.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            (widget.icon == null)
                ? Container()
                : Row(
                    children: <Widget>[
                      SizedBox(height: 24, width: 24, child: widget.icon),
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                      ),
                    ],
                  ),
            Expanded(
              child: SizedBox.fromSize(
                child: Center(
                  child: TextField(
                    keyboardType: widget.inputType,
                    obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
                    style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                    textAlign: TextAlign.justify,
                    enabled: widget.enabled ?? true,
                    controller: _textEditController,
                    textInputAction: TextInputAction.next,
                    onChanged: onChangedInternal,
                    inputFormatters: widget.textInputFormatter,
                    onSubmitted: (val) {
                      print("onSubmitted-->${val}");
                      // context.nextEditableTextFocus();
                      /*  onSubmitted(val);
                      FocusScope.of(context).requestFocus(widget.focusNode);*/
                    },
                    onEditingComplete: onEditingComplete,
                    maxLines: 1,
                    maxLength: widget.maxLength,
                    onTap: () {
                      onTapInternal();
                    },
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: widget.placeholder,
                        hintStyle: defaultHintStyle(null, null),
                        contentPadding: EdgeInsets.only(bottom: 12),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            (widget.rightIcon == null)
                ? Container()
                : Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                      ),
                      SizedBox(height: 24, width: 24, child: widget.rightIcon),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 36),
      height: 36.0,
      child: IgnorePointer(
        ignoring: !(widget?.enabled ?? true),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (widget.colorItems ?? []).length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              onChangedInternal(widget.colorItems[index].value);
                            },
                            child: Container(
                              height: 17,
                              width: 17,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: Color(widget.colorItems[index].colorCode)),
                              child: Center(
                                child: (widget.fieldValue.toString() == widget.colorItems[index].value)
                                    ? Images.instance.smallCheck()
                                    : Container(),
                              ),
                            ),
                          ),
                          Space(
                            horizontal: 8,
                          )
                        ],
                      );
                    }))
          ],
        ),
      ),
    );
  }

  Widget buildStepperField(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 62,
              height: 36,
              child: IgnorePointer(
                ignoring: !(widget?.enabled ?? true),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(color: widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
                    color: widget.fieldBackgroundColor,
                  ),
                  child: Center(
                    child: TextField(
                      style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                      textAlign: TextAlign.center,
                      enabled: false,
                      controller: _textEditController,
                      maxLines: 1,
                      maxLength: 3,
                      inputFormatters: widget.textInputFormatter,
                      decoration: InputDecoration(
                          counterText: "",
                          hintText: widget.placeholder,
                          hintStyle: defaultHintStyle(null, null),
                          contentPadding: EdgeInsets.only(bottom: 12),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
            ),
            Space(
              horizontal: 8,
            ),
            CountStepper(
              height: 28,
              width: 101,
              increment: (widget.enabled) ? widget.onIncrement : null,
              decrement: (widget.enabled) ? widget.onDecrement : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleTagPicker(BuildContext context) {
    int selected = 0;
    return Container(
//      constraints: BoxConstraints.expand(height: 100),
//      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: IgnorePointer(
                ignoring: !(widget?.enabled ?? true),
                child: Tags(
                  spacing: 8,
                  columns: 5,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  symmetry: false,
                  textDirection: isDirectionRTL(context) == true ? TextDirection.rtl : TextDirection.ltr,
                  itemCount: (widget.tagsItems ?? []).length,
                  itemBuilder: (int index) {
                    return ItemTags(
                      pressEnabled: widget.tagsItems[index].isEnabled,
                      index: index,
                      elevation: 0,
                      icon: widget.tagsItems[index].icon != null
                          ? ItemTagsIcon(icon: widget.tagsItems[index].icon)
                          : null,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      title: widget.tagsItems[index].label,
                      textColor: widget.tagsItems[index].isEnabled ? regularTextColor : disabledBtnBGColor,
                      textActiveColor: enabledBtnTextColor,
                      color: bgColor,
                      activeColor: enabledBtnBGColor,
                      border: Border.all(width: 0, color: Colors.transparent),
                      active: widget.tagsItems[index].value == widget.fieldValue.toString(),
                      textStyle: normalLabelTextStyle(15, regularTextColor),
                      combine: ItemTagsCombine.withTextAfter,
                      // OR null,
                      onPressed: (item) {
                        onChangedInternal(widget.tagsItems[index].value);
                      },
                      onLongPressed: (item) => print(item),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearchSingleTagPicker(BuildContext context) {
    int selected = 0;
    return Container(
      margin: EdgeInsets.all(16),
//      constraints: BoxConstraints.expand(height: 100),
//      height: 100.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(color: widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
              color: widget.fieldBackgroundColor,
            ),
            child: SizedBox(
              height: widget.height,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  (widget.icon == null)
                      ? Container()
                      : Row(
                          children: <Widget>[
                            SizedBox(height: 24, width: 24, child: widget.icon),
                            Padding(
                              padding: EdgeInsets.only(left: 6),
                            ),
                          ],
                        ),
                  Expanded(
                    child: SizedBox.fromSize(
                      child: Center(
                        child: TextField(
                          keyboardType: widget.inputType,
                          obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
                          style:
                              normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                          textAlign: TextAlign.justify,
                          enabled: widget.enabled ?? true,
                          controller: _textEditController,
                          onChanged: onChangedInternal,
                          inputFormatters: widget.textInputFormatter,
                          onSubmitted: (val) {
                            // FocusScope.of(context).requestFocus(new FocusNode());
                            context.nextEditableTextFocus();
                            onSubmitted(val);
                          },
                          onEditingComplete: onEditingComplete,
                          maxLines: 1,
                          maxLength: widget.maxLength,
                          onTap: () {
                            onTapInternal();
                          },
                          decoration: InputDecoration(
                              counterText: "",
                              hintText: widget.placeholder,
                              hintStyle: defaultHintStyle(null, null),
                              contentPadding: EdgeInsets.only(bottom: 12),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  isBlank(currentFieldValue)
                      ? Container()
                      : Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 6),
                            ),
                            SizedBox(height: 24, width: 24, child: Images.instance.cross()),
                          ],
                        ),
                ],
              ),
            ),
          ),
          Space(
            vertical: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: IgnorePointer(
                  ignoring: !(widget?.enabled ?? true),
                  child: Tags(
                    spacing: 8,
                    columns: 2,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    symmetry: false,
                    textDirection: isDirectionRTL(context) == true ? TextDirection.rtl : TextDirection.ltr,
                    itemCount: (widget.tagsItems ?? []).length,
                    itemBuilder: (int index) {
                      return ItemTags(
                        pressEnabled: widget.tagsItems[index].isEnabled,
                        index: index,
                        elevation: 0,
                        icon: widget.tagsItems[index].icon != null
                            ? ItemTagsIcon(icon: widget.tagsItems[index].icon)
                            : null,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                        title: widget.tagsItems[index].label,
                        textColor: widget.tagsItems[index].isEnabled ? regularTextColor : disabledBtnBGColor,
                        textActiveColor: Colors.white,
                        color: Colors.white,
                        activeColor: enabledBtnBGColor,
                        border: Border.all(width: 1, color: separatorColor),
                        borderRadius: BorderRadius.circular(4),
                        active: widget.tagsItems[index].value == widget.fieldValue.toString(),
                        textStyle: normalLabelTextStyle(15, regularTextColor),
                        combine: ItemTagsCombine.withTextAfter,
                        // OR null,
                        onPressed: (item) {
                          onChangedInternal(widget.tagsItems[index].value);
                        },
                        onLongPressed: (item) => print(item),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildMultiTagPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: IgnorePointer(
              ignoring: !(widget?.enabled ?? true),
              child: Tags(
                spacing: 8,
                columns: 7,
                runSpacing: 8,
                alignment: Directionality.of(context) == TextDirection.rtl ? WrapAlignment.end : WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                symmetry: false,
                itemCount: (widget.tagsItems ?? []).length,
                itemBuilder: (int index) {
                  return ItemTags(
                    pressEnabled: widget.tagsItems[index].isEnabled,
                    index: index,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    title: widget.tagsItems[index].label,
                    textColor: regularTextColor,
                    textActiveColor: enabledBtnTextColor,
                    color: bgColor,
                    activeColor: enabledBtnBGColor,
                    border: Border.all(width: 0, color: Colors.transparent),
                    active:
                        (widget?.fieldValue?.where((data) => data == widget.tagsItems[index].value)?.toList()?.length ??
                                0) >
                            0,
                    textStyle: normalLabelTextStyle(15, regularTextColor),
                    combine: ItemTagsCombine.withTextBefore,
                    // OR null,
                    onPressed: (item) {
                      onChangedInternal(widget.tagsItems[index].value);
                    },
                    onLongPressed: (item) => print(item),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: SizedBox.fromSize(
              child: Center(
                child: TextField(
                  //key: widget.gKey,
                  keyboardType: widget.inputType,
                  obscureText: (widget.isPassword == false || widget.isPassword == null) ? false : true,
                  style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                  textAlign: TextAlign.justify,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  inputFormatters: widget.textInputFormatter,
                  onSubmitted: (val) {
                    // FocusScope.of(context).requestFocus(new FocusNode());
                    context.nextEditableTextFocus();
                    onSubmitted(val);
                  },
                  onEditingComplete: onEditingComplete,
                  maxLines: 1,
                  maxLength: widget.maxLength,
                  onTap: () {
                    onTapInternal();
                  },
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: widget.placeholder,
                      hintStyle: defaultHintStyle(null, null),
                      contentPadding: EdgeInsets.only(bottom: 12),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          (widget.rightIcon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildPhoneField(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: SizedBox.fromSize(
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 124,
                      color: separatorColor,
                      child: Row(
                        children: [
                          Space(horizontal: 4),
                          Expanded(
                            child: CountryPickerDropdown(
                              isExpanded: true,
                              initialValue: widget.countryCode?.isoCode,
                              icon: Text("",
                                  style: normalLabelTextStyle(
                                      15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45)),
                              itemBuilder: _buildDropdownItem,
                              selectedItemBuilder: _buildPhoneFieldItem,
                              priorityList: [
                                CountryPickerUtils.getCountryByIsoCode('AE'),
                                CountryPickerUtils.getCountryByIsoCode("EG"),
                                CountryPickerUtils.getCountryByIsoCode("QA"),
                                CountryPickerUtils.getCountryByIsoCode("SA"),
                                CountryPickerUtils.getCountryByIsoCode("OM"),
                                CountryPickerUtils.getCountryByIsoCode("KW"),
                                CountryPickerUtils.getCountryByIsoCode('IN'),
                              ],
                              sortComparator: (Country a, Country b) => a.phoneCode.compareTo(b.phoneCode),
                              onValuePicked: (Country country) {
                                widget.countryCode = country;
                                onChangedInternal(_textEditController.text);
                                // widget.country = country.isoCode;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space(horizontal: 8),
                    Expanded(
                      child: TextField(
                        textDirection: TextDirection.ltr,
                        style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                        textAlign: isDirectionRTL(context) ? TextAlign.end : TextAlign.start,
                        keyboardType: TextInputType.phone,
                        enabled: widget.enabled ?? true,
                        controller: _textEditController,
                        onChanged: onChangedInternal,
                        onSubmitted: (val) {
                          // FocusScope.of(context).requestFocus(new FocusNode());
                          context.nextEditableTextFocus();
                          onSubmitted(val);
                        },
                        onEditingComplete: onEditingComplete,
                        maxLines: 1,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        maxLength: widget.maxLength,
                        onTap: () {
                          onTapInternal();
                        },
                        decoration: InputDecoration(
                            counterText: "",
                            hintText: widget.placeholder,
                            hintStyle: defaultHintStyle(null, null),
                            contentPadding: EdgeInsets.only(bottom: 12),
                            border: InputBorder.none),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          (widget.rightIcon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                ),
          Space(
            horizontal: 8,
          )
        ],
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: SizedBox(
          width: 145,
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              Space(
                horizontal: 8,
              ),
              Text(
                "+${country.phoneCode}",
                style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
              ),
              Text(
                " (${country.isoCode})",
                style: normalLabelTextStyle(11, (widget?.enabled ?? true) ? regularTextColor : Colors.black38),
              ),
            ],
          ),
        ),
      );

  Widget _buildPhoneFieldItem(Country country) => Container(
        child: SizedBox(
          width: 145,
          child: Row(
            children: <Widget>[
              CountryPickerUtils.getDefaultFlagImage(country),
              Space(
                horizontal: 8,
              ),
              Text(
                "+${country.phoneCode}",
                style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
              ),
            ],
          ),
        ),
      );

  Widget buildLocationPicker(BuildContext context) {
    return Container(
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: TypeAheadField(
              hideOnEmpty: true,
              hideOnLoading: false,
              hideOnError: true,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(13),
                elevation: 6.0,
              ),
              keepSuggestionsOnLoading: false,
              direction: widget.direction,
              debounceDuration: Duration(milliseconds: 400),
              textFieldConfiguration: TextFieldConfiguration(
                style: normalLabelTextStyle(15, regularTextColor),
                controller: _textEditController,
                decoration: InputDecoration(
                  counterText: "",
                  contentPadding: EdgeInsets.only(bottom: 12),
                  hintText: widget.placeholder,
                  hintStyle: defaultHintStyle(null, null),
                  border: InputBorder.none,
                ),
              ),
              suggestionsCallback: (pattern) async {
                final result = await fetchLocationsByQueryUseCase(FetchLocationsByQueryParams(
                    query: pattern, type: (widget.locationType == LocationType.Address) ? "address" : "establishment"));
                return result.fold(
                  (error) => [],
                  (success) => success.predictions,
                );
              },
              itemBuilder: (context, prediction) {
                return Listener(
                  child: ListTile(
                    title: Text(
                      prediction.description,
                      style: normalLabelTextStyle(15, regularTextColor),
                    ),
                    subtitle: Text(
                      "${prediction.terms[prediction.terms.length - 2].value}, ${prediction.terms.last.value}",
                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
                    ),
                  ),
                  onPointerDown: (event) {
                    //   onChangedInternal(item);
                  },
                );
              },
              onSuggestionSelected: (suggestion) async {
                onChangedInternal(suggestion);
                final result = await fetchLocationsByPlaceIdUseCase(FetchLocationsByPlaceIdParams(
                  placeId: (suggestion as Prediction).placeId,
                ));
                result.fold(
                  (error) {
                    onChangedInternal(suggestion);
                  },
                  (success) {
                    suggestion.location = success.result.geometry.location;
                    onChangedInternal(suggestion);
                  },
                );
              },
            ),
          ),
          isBlank(currentFieldValue)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                    GestureDetector(
                        onTap: () {
                          if (currentFieldValue != "") {
                            _textEditController.clear();
                            onChangedInternal(Prediction());
                          }
                        },
                        child: SizedBox(
                            height: 24,
                            width: 24,
                            child: (currentFieldValue != "") ? Images.instance.cross() : Container())),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildSearchPicker(BuildContext context) {
    return Container(
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: TypeAheadField(
              hideOnEmpty: true,
              hideOnLoading: false,
              hideOnError: true,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(13),
                elevation: 6.0,
              ),
              keepSuggestionsOnLoading: false,
              direction: widget.direction,
              debounceDuration: Duration(milliseconds: 200),
              loadingBuilder: (context) {
                return Container(
                  height: 100,
                  child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                        )),
                  ),
                );
              },
              textFieldConfiguration: TextFieldConfiguration(
                  style: normalLabelTextStyle(15, regularTextColor),
                  controller: _textEditController,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsets.only(
                      bottom: 12,
                    ),
                    hintText: widget.placeholder,
                    hintStyle: defaultHintStyle(null, null),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {}),
              suggestionsCallback: (pattern) async {
                if (!isBlank(pattern)) {
                  var result;
                  if (widget.useCase is FetchServicesUseCase) {
                    FetchServicesParams params = FetchServicesParams(
                        showArchived: false, serviceListId: "", query: pattern, pageNumber: 1, pasSize: 20);
                    result = await widget.useCase(params);
                    return result.fold(
                      (error) => [],
                      (success) => success.results,
                    );
                  } else if (widget.useCase is FetchProviderServicesUseCase) {
                    FetchProviderServicesParams params = FetchProviderServicesParams(
                        showArchived: false,
                        providerId: widget.useCaseParam,
                        query: pattern,
                        pageNumber: 1,
                        pasSize: 20);
                    result = await widget.useCase(params);
                    return result.fold(
                      (error) => [],
                      (success) => success.results,
                    );
                  } else if (widget.useCase is FetchPatientsUseCase && widget.useCaseParam is FetchPatientsParams) {
                    FetchPatientsParams params = widget.useCaseParam as FetchPatientsParams;
                    params = FetchPatientsParams(
                        orgId: params.orgId,
                        isArchived: params.isArchived,
                        practiceId: params.practiceId,
                        pageSize: params.pageSize,
                        pageNum: params.pageNum,
                        status: params.status,
                        query: pattern);
                    result = await widget.useCase(params);
                    return result.fold(
                      (error) => [],
                      (success) => success.patientData,
                    );
                  } else {
                    result = await widget.useCase(QueryParams(query: pattern, searchFor: widget.valueSetGroup));

                    return result.fold(
                      (error) => [],
                      (success) {
                        if (widget.useCase is FlagListUseCase) {
                          List<FlagListResponse> flagListResponse = success;
                          List<FlagResponse> flagsList = [];
                          flagListResponse.forEach((resp) {
                            flagsList.addAll(resp.flagResponse);
                          });
                          return flagsList;
                        } else {
                          return success;
                        }
                      },
                    );
                  }
                } else {
                  return [];
                }
              },
              itemBuilder: (context, item) {
                if (item is BillingServiceModel) {
                  return Listener(
                      child: SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      item?.procedureCode?.displayName,
                                      style: normalLabelTextStyle(15, regularTextColor),
                                    ),
                                    Text(
                                      item?.procedureCode?.code,
                                      overflow: TextOverflow.visible,
                                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onPointerDown: (event) {
                        // onChangedInternal(item);
                      });
                } else if (item is ProviderServiceFee) {
                  return Listener(
                      child: SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      item?.procedureCode?.displayName,
                                      style: normalLabelTextStyle(15, regularTextColor),
                                    ),
                                    Text(
                                      item?.procedureCode?.code,
                                      overflow: TextOverflow.visible,
                                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onPointerDown: (event) {
                        // onChangedInternal(item);
                      });
                } else if (item is PatientDatum) {
                  return Listener(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          children: <Widget>[
                            CircleImage(
                              size: 24,
                              image: item?.image,
                            ),
                            Space(
                              horizontal: 16,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    item.name,
                                    style: normalLabelTextStyle(15, regularTextColor),
                                  ),
                                  Text(
                                    (item.guardianId != null &&
                                            item.guardianId != "00000000-0000-0000-0000-000000000000")
                                        ? "${scDateFormat(item.birthDate)} (${item?.age ?? "N/A"}) • ${item?.gender?.name}"
                                        : "${scDateFormat(item.birthDate)} (${item?.age ?? "N/A"}) • ${item?.gender?.name} • ${item?.phone ?? "N/A"}",
                                    maxLines: 2,
                                    overflow: TextOverflow.visible,
                                    style: normalLabelTextStyle(13, labelTextStyleTextColor),
                                  ),
                                  (item.guardianId != null && item.guardianId != "00000000-0000-0000-0000-000000000000")
                                      ? Text(
                                          "${item?.guardian?.relationship?.name ?? "N/A"} • ${item?.guardian?.firstName} ${item?.guardian?.lastName} • ${item?.phone ?? "N/A"}",
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                          style: normalLabelTextStyle(13, labelTextStyleTextColor),
                                        )
                                      : Container()
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onPointerDown: (event) {
                        // onChangedInternal(item);
                      });
                } else if (item is CodeList) {
                  return Listener(
                      child: SizedBox(
                        width: 300,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Text(
                                      item?.code?.displayName,
                                      style: normalLabelTextStyle(15, regularTextColor),
                                    ),
                                    Text(
                                      item?.code?.code,
                                      overflow: TextOverflow.visible,
                                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onPointerDown: (event) {
                        // onChangedInternal(item);
                      });
                } else {
                  String displayText = "";
                  if (item is HospitalList) {
                    displayText = item?.hospitalName ?? "";
                  } else if (item is MedicalSchools) {
                    displayText = item?.medicalSchool ?? "";
                  } else if (item is AppointmentValueSets) {
                    displayText = item?.display ?? "";
                  } else if (item is FlagResponse) {
                    displayText = item?.display;
                  } else if (item is Allergies) {
                    displayText = item?.display;
                  } else if (item is Symptoms) {
                    displayText = item?.display;
                  } else if (item is DiagnosisCode) {
                    displayText = item?.code?.display;
                  } else if (item is VaccinationCodes) {
                    displayText = item?.code?.display;
                  } else if (item is Relationship) {
                    displayText = item?.name;
                  } else if (item is ValueSetData) {
                    displayText = item?.toString();
                  } else {
                    displayText = item?.code?.displayName ?? "n/a";
                  }
                  return Listener(
                    child: ListTile(
                      title: Text(
                        displayText,
                        style: normalLabelTextStyle(15, regularTextColor),
                      ),
                    ),
                    onPointerDown: (event) {
                      //   onChangedInternal(item);
                    },
                  );
                }
              },
              onSuggestionSelected: (item) {
                onChangedInternal(item);
              },
            ),
          ),
          isBlank(currentFieldValue)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                    GestureDetector(
                        onTap: () {
                          _textEditController.clear();
                          currentFieldValue = null;
                          onChangedInternal(null);
                        },
                        child: SizedBox(
                            height: 24,
                            width: 24,
                            child: (currentFieldValue != "") ? Images.instance.cross() : Container())),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildSearchValueSetsPicker(BuildContext context) {
    return Container(
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                  ],
                ),
          Expanded(
            child: TypeAheadField(
              debounceDuration: Duration(milliseconds: 200),
              hideOnEmpty: false,
              hideOnLoading: false,
              hideOnError: false,
              suggestionsBoxDecoration: SuggestionsBoxDecoration(
                borderRadius: BorderRadius.circular(13),
                elevation: 6.0,
              ),
              keepSuggestionsOnLoading: false,
              direction: widget.direction,
              loadingBuilder: (context) {
                return Container(
                  height: 100,
                  child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                        )),
                  ),
                );
              },
              textFieldConfiguration: TextFieldConfiguration(
                  style: normalLabelTextStyle(15, regularTextColor),
                  controller: _textEditController,
                  decoration: InputDecoration(
                    counterText: "",
                    contentPadding: EdgeInsetsDirectional.only(
                      bottom: 12,
                    ),
                    hintText: widget.placeholder,
                    hintStyle: defaultHintStyle(null, null),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {}),
              suggestionsCallback: (pattern) async {
                if (!isBlank(pattern)) {
                  final result = await fetchValueSetsUseCase(FetchValueSetsParams(
                      request: {"SearchText": pattern, "SearchFor": widget.valueSetGroup, "Country": ""}));
                  return result.fold(
                    (error) => [],
                    (success) => success,
                  );
                } else {
                  return null;
                }
              },
              itemBuilder: (context, prediction) {
                return Listener(
                  child: ListTile(
                    title: Text(
                      prediction?.valueCoding?.display ?? "n/a",
                      style: normalLabelTextStyle(15, regularTextColor),
                    ),
//                    subtitle: Text(
//                      "${prediction.terms[prediction.terms.length - 2].value}, ${prediction.terms.last.value}",
//                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
//                    ),
                  ),
                  onPointerDown: (event) {
                    //   onChangedInternal(item);
                  },
                );
              },
              onSuggestionSelected: (prediction) {
                onChangedInternal(prediction);
              },
            ),
          ),
          (currentFieldValue == "")
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                    GestureDetector(
                        onTap: () {
                          if (currentFieldValue != "") {
                            _textEditController.clear();
                            onChangedInternal(Prediction());
                          }
                        },
                        child: SizedBox(
                            height: 24,
                            width: 24,
                            child: (currentFieldValue != "") ? Images.instance.cross() : Container())),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildDateRangePickerField(BuildContext context) {
    return Container(
      color: bgColor,
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                  ],
                ),
          Expanded(
            child: InkWell(
              onTap: () async {
                List<DateTime> dates = [];
                if ((currentFieldValue ?? widget.fieldValue) is List<DateTime>) {
                  dates = currentFieldValue;
                }
                final List<DateTime> picked = await DateRagePicker.showDatePicker(
                    okText: widget.okText,
                    cancelText: widget.cancelText,
                    context: context,
                    initialFirstDate:
                        ((dates?.length ?? 0) == 0) ? DateTime.now() : (dates?.elementAt(0) ?? DateTime.now()),
                    initialLastDate: (dates?.length ?? 0) > 1
                        ? (dates?.elementAt(1) ?? dates?.elementAt(0)?.add(Duration(seconds: 10)))
                        : DateTime.now().add(Duration(seconds: 10)),
                    firstDate: new DateTime(DateTime.now().year, 1, 1).subtract(Duration(days: 365 * 20)),
                    lastDate: new DateTime(DateTime.now().year, 12, 31).add(Duration(days: 365 * 20)),
                    range: DateRagePicker.DatePickerRange.multi);
                if (picked != null) {
                  print(picked);
                  onChangedInternal(picked);
                }
              },
              child: InkWell(
                onTap: () async {
                  List<DateTime> dates = [];
                  if ((currentFieldValue ?? widget.fieldValue) is List<DateTime>) {
                    dates = currentFieldValue;
                  }
                  final List<DateTime> picked = await DateRagePicker.showDatePicker(
                      okText: widget.okText,
                      cancelText: widget.cancelText,
                      context: context,
                      initialFirstDate:
                          ((dates?.length ?? 0) == 0) ? DateTime.now() : (dates?.elementAt(0) ?? DateTime.now()),
                      initialLastDate: (dates?.length ?? 0) > 1
                          ? (dates?.elementAt(1) ?? dates?.elementAt(0)?.add(Duration(seconds: 10)))
                          : DateTime.now().add(Duration(seconds: 10)),
                      firstDate: new DateTime(DateTime.now().year, 1, 1).subtract(Duration(days: 365 * 20)),
                      lastDate: new DateTime(DateTime.now().year, 12, 31).add(Duration(days: 365 * 20)),
                      range: DateRagePicker.DatePickerRange.multi);
                  if (picked != null) {
                    print(picked);
                    onChangedInternal(picked);
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
                    style: normalLabelTextStyle(15, regularTextColor),
                    textAlign: TextAlign.start,
                    enabled: widget.enabled ?? true,
                    controller: _textEditController,
                    onChanged: onChangedInternal,
                    onSubmitted: onSubmitted,
                    onEditingComplete: onEditingComplete,
                    inputFormatters: widget.textInputFormatter,
                    decoration: InputDecoration(
                        counterText: "",
                        hintText: widget.placeholder,
                        contentPadding: EdgeInsetsDirectional.only(bottom: 12),
                        hintStyle: defaultHintStyle(null, null),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
          ),
          (widget.rightIcon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildDatePickerField(BuildContext context) {
    widget.firstDate =
        widget.firstDate == null ? new DateTime.now().subtract(Duration(days: 365 * 100)) : widget.firstDate;
    widget.lastDate = widget.lastDate == null ? new DateTime.now().add(Duration(days: 365 * 100)) : widget.lastDate;

    DateTime defaultMinDate =
        (widget.firstDate?.isAfter(dateOnly(DateTime.now())) ?? false) ? widget.firstDate : dateOnly(DateTime.now());

    return Container(
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : InkWell(
                  onTap: !widget.enabled
                      ? null
                      : () async {
                          final List<DateTime> picked = await DateRagePicker.showDatePicker(
                              okText: widget.okText,
                              cancelText: widget.cancelText,
                              context: context,
                              initialFirstDate: currentFieldValue != null
                                  ? ((widget.firstDate.isBefore(currentFieldValue) ||
                                          widget.lastDate.isAfter(currentFieldValue))
                                      ? (widget.lastDate.isBefore(currentFieldValue)
                                          ? widget.lastDate
                                          : (widget.firstDate.isAfter(currentFieldValue)
                                              ? widget.firstDate
                                              : currentFieldValue))
                                      : defaultMinDate)
                                  : defaultMinDate,
                              selectableDayPredicate: (dt) {
                                return !(dt.isBefore(
                                      widget.firstDate,
                                    ) &&
                                    dt.isAfter(widget.lastDate));
                              },
                              initialLastDate: null,
                              firstDate: widget.firstDate,
                              lastDate: widget.lastDate,
                              range: DateRagePicker.DatePickerRange.single);
                          if (picked != null) {
                            print(picked);
                            onChangedInternal(picked.first);
                          }
                        },
                  child: Row(
                    children: <Widget>[
                      SizedBox(height: 24, width: 24, child: widget.icon),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 6),
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: TextField(
              obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
              style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
              textAlign: TextAlign.start,
              enabled: true,
              keyboardType: TextInputType.datetime,
              controller: _textEditController,
              onChanged: onChangedInternal,
              onSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              inputFormatters: [
                // DateTextFormatter(),
                FilteringTextInputFormatter(RegExp("[0-9/]"), allow: true),
              ],
              decoration: InputDecoration(
                  counterText: "",
                  hintText: "dd/mm/yyyy",
                  contentPadding: EdgeInsetsDirectional.only(bottom: 12),
                  hintStyle: defaultHintStyle(null, null),
                  border: InputBorder.none),
            ),
          ),
          (widget.rightIcon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                )
        ],
      ),
    );
  }

  Widget buildTimePickerField(BuildContext context) {
    return Container(
      height: 36.0,
      constraints: BoxConstraints.expand(height: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          (widget.icon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    SizedBox(height: 24, width: 24, child: widget.icon),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                  ],
                ),
          Expanded(
            child: InkWell(
              onTap: !widget.enabled
                  ? null
                  : () async {
                      var time = currentFieldValue == null || currentFieldValue.hour == null
                          ? TimeOfDay.now()
                          : currentFieldValue;

                      final timeOfDay = await showTimePicker(
                          context: context, initialEntryMode: TimePickerEntryMode.input, initialTime: time);

                      if (timeOfDay != null) {
                        print(timeOfDay);
                        onChangedInternal(timeOfDay);
                      }
                    },
              child: IgnorePointer(
                child: TextField(
                  obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
                  style: normalLabelTextStyle(15, (widget?.enabled ?? true) ? regularTextColor : Colors.black45),
                  textAlign: TextAlign.start,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: onSubmitted,
                  onEditingComplete: onEditingComplete,
                  inputFormatters: widget.textInputFormatter,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: widget.placeholder,
                      contentPadding: EdgeInsetsDirectional.only(bottom: 12),
                      hintStyle: defaultHintStyle(null, null),
                      border: InputBorder.none),
                ),
              ),
            ),
          ),
          (widget.rightIcon == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildRichText(BuildContext context) {
    return RichText(
      text: widget.fieldValue ?? "",
      textAlign: TextAlign.start,
    );
  }

  Widget buildLabelField(BuildContext context) {
    return Text(
      widget.fieldValue ?? "",
      style: widget.labelValueTextStyle ?? normalLabelTextStyle(15, regularTextColor),
      textAlign: TextAlign.start,
    );
  }

  Widget buildRichTextEdit(BuildContext context) {
    return Container(
      height: 80.0,
      constraints: BoxConstraints.expand(height: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: TextField(
              obscureText: widget.isPassword == false || widget.isPassword == null ? false : true,
              style: normalLabelTextStyle(15, regularTextColor),
              textAlign: TextAlign.start,
              enabled: widget.enabled ?? true,
              maxLines: null,
              controller: _textEditController,
              onChanged: onChangedInternal,
              onSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              keyboardType: TextInputType.multiline,
              maxLength: widget.maxLength,
              inputFormatters: widget.textInputFormatter,
              minLines: 3,
              onTap: onTapInternal,
              decoration: InputDecoration(
                  //counterText: "",
                  counterStyle: normalLabelTextStyle(8, regularTextColor),
                  hintText: widget.placeholder,
                  hintStyle: defaultHintStyle(null, null),
                  contentPadding: EdgeInsetsDirectional.only(bottom: -10, top: 4),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

//

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
