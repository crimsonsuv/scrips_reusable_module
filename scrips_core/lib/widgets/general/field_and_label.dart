import 'dart:async';

import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:flutter_typeahead_web/flutter_typeahead.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_query_use_case.dart';
import 'package:scrips_core/common/domain/usecases/fetch_value_sets_use_case.dart';
import 'package:scrips_core/common/domain/usecases/query_params.dart';
import 'package:scrips_core/common/domain/usecases/verify_phone_use_case.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/di/dependency_injection.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/stepper_widget.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/appointment_value_sets_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/hospital_list_model.dart';
import 'package:scrips_shared_features/features/common/data/datamodels/medical_schools_model.dart';

enum FieldType {
  TextField,
  DropDownList,
  List,
  RichText,
  RichTextEdit,
  DatePicker,
  DateRangePicker,
  LocationPicker,
  PhoneField,
  SingleTagPicker,
  MultiTagPicker,
  ValueSetPicker,
  SearchPicker,
  ColorPicker,
  StepperField,
}

enum LocationType {
  Establishment,
  Address,
}

class FieldAndLabel<ListItemType> extends StatefulWidget {
  final FieldType fieldType;
  final Color labelTextColor;
  final TextStyle labelTextStyle;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  final String labelValue;
  final dynamic fieldValue;
  final String country;
  final bool enabled;
  final double width;
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
  final FocusNode focusNode;
  final LocationType locationType;
  final DateTime firstDate;
  final DateTime lastDate;
  final List<ListItemType> listItems;
  final List<ValueDisplayPair> tagsItems;
  final List<ColorCodePair> colorItems;
  final String valueSetGroup;
  final dynamic useCase;
  FieldAndLabelState _myState;
  final AxisDirection direction;

  //
  FieldAndLabel(
      {Key key,
      this.labelValue,
      this.labelTextCapitalization = TextCapitalization.characters,
      this.labelTextStyle,
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
      this.valueSetGroup,
      this.useCase,
      this.direction = AxisDirection.down,
      this.wrapWithRow = true})
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
  VerifyPhoneUseCase verifyPhoneUseCase;
  Timer _debounce;
  FetchValueSetsUseCase fetchValueSetsUseCase;

  //  ZefyrController _richTextEditController;
  //  FocusNode _richTextEditFocusNode;

  void initState() {
    super.initState();
    fetchLocationsByQueryUseCase =
        FetchLocationsByQueryUseCase(repository: coreSl());
    fetchValueSetsUseCase = FetchValueSetsUseCase(repository: coreSl());

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
            text:
                "${scDateFormat(dates.elementAt(0))} - ${scDateFormat(dates.elementAt(1)) ?? "NA"}");
      } else if (dates.length == 1) {
        _textEditController =
            TextEditingController(text: scDateFormat(dates.elementAt(0)));
      } else {
        _textEditController = TextEditingController(text: "");
      }
    } else if (widget.fieldType == FieldType.DatePicker) {
      _textEditController =
          TextEditingController(text: scDateFormat(currentFieldValue));
    } else if (widget.fieldType == FieldType.PhoneField) {
      _textEditController = TextEditingController(text: currentFieldValue);
    }
  }

  onChangedInternal(value) async {
//    debugLog('onChangedInternal $value');
//    setState(() {
    currentFieldValue = value;
//    });
    if (widget.onChanged != null) {
      // also pass this so UI can call methods such as setValidationMessage
      if (widget.fieldType == FieldType.PhoneField) {
        if (value.toString().length == 0) {
          setValidationMessage("");
          widget.onChanged(value, this);
        } else {
          if (value.toString().length < 8) {
            setValidationMessage("Please, provide a valid number");
          } else {
            setValidationMessage("validating phone..");
            if (_debounce?.isActive ?? false) _debounce.cancel();
            _debounce = Timer(const Duration(milliseconds: 500), () async {
              final result = await verifyPhoneUseCase(
                  VerifyPhoneParams(phone: value, country: widget.country));
              result.fold((error) {
                if (currentFieldValue.toString().length > 0) {
                  setValidationMessage(error.message);
                  widget.onChanged(value, this);
                } else {
                  setValidationMessage("");
                  widget.onChanged("", this);
                }
              }, (success) {
                setValidationMessage("");
                widget.onChanged(value, this);
              });
            });
          }
        }
      } else {
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
//    debugLog(value);
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
    return Expanded(
      child: Container(
        padding: widget.padding ?? UIHelper.defaultFieldAndLabelPadding,
        margin: widget.margin ?? UIHelper.defaultFieldAndLabelMargin,
        decoration: widget.boxDecoration ?? UIHelper.defaultFieldAndLabelBorder,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildLabel(context),
              buildField(context),
              buildValidationMessage(context),
            ]),
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
            decoration:
                UIHelper.defaultLabelBoxDecoration(widget.labelBackgroundColor),
            child: Row(children: <Widget>[
              Text(
                widget.labelValue,
                style: this.widget.labelTextStyle ??
                    defaultLabelStyle(
                        widget.labelTextColor, widget.labelBackgroundColor),
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
                      style: this
                              .widget
                              .labelTextStyle
                              .copyWith(color: defaultValidationTextColor) ??
                          defaultLabelStyle(
                                  widget.labelTextColor, Colors.transparent)
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
      case FieldType.RichTextEdit:
        field = buildRichTextEdit(context);
        break;
      case FieldType.DropDownList:
        field = buildDropDownList(context);
        break;
      case FieldType.DatePicker:
        field = buildDatePickerField(context);
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
        break;
      case FieldType.SingleTagPicker:
        field = buildSingleTagPicker(context);
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
      default:
        field = Container();
        break;
    }
    return Container(
      padding: (widget.fieldType == FieldType.SingleTagPicker ||
              widget.fieldType == FieldType.MultiTagPicker ||
              widget.fieldType == FieldType.ColorPicker ||
              widget.fieldType == FieldType.StepperField)
          ? EdgeInsets.symmetric(horizontal: 0)
          : EdgeInsets.symmetric(horizontal: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: (widget.fieldType == FieldType.SingleTagPicker ||
                widget.fieldType == FieldType.MultiTagPicker ||
                widget.fieldType == FieldType.ColorPicker ||
                widget.fieldType == FieldType.StepperField)
            ? null
            : Border.all(
                color:
                    widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
        color: (widget.fieldType == FieldType.SingleTagPicker ||
                widget.fieldType == FieldType.MultiTagPicker ||
                widget.fieldType == FieldType.ColorPicker ||
                widget.fieldType == FieldType.StepperField)
            ? Colors.transparent
            : widget.fieldBackgroundColor,
      ),
      child: Center(child: field),
    );
  }

  Widget buildValidationMessage(BuildContext context) {
    return UIHelper.buildValidationMessage(context,
        validationMessage:
            currentValidationMessage ?? widget.validationMessage ?? null);
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
                style: normalLabelTextStyle(
                    15,
                    (widget?.enabled ?? true)
                        ? regularTextColor
                        : Colors.black45),
                hint: Text(widget.placeholder ?? '',
                    style: defaultHintStyle(null, null)),
                disabledHint: Text(widget.validationMessage ?? '',
                    style: defaultHintStyle(null, null)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: 36),
      height: 36.0,
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
                                color:
                                    Color(widget.colorItems[index].colorCode)),
                            child: Center(
                              child: (widget.fieldValue.toString() ==
                                      widget.colorItems[index].value)
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
                    border: Border.all(
                        color: widget.fieldBackgroundColor ??
                            defaultFieldBackgroundColor),
                    color: widget.fieldBackgroundColor,
                  ),
                  child: Center(
                    child: TextField(
                      style: normalLabelTextStyle(
                          15,
                          (widget?.enabled ?? true)
                              ? regularTextColor
                              : Colors.black45),
                      textAlign: TextAlign.center,
                      enabled: false,
                      controller: _textEditController,
                      maxLines: 1,
                      maxLength: 3,
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
                  itemCount: (widget.tagsItems ?? []).length,
                  itemBuilder: (int index) {
                    return ItemTags(
                      pressEnabled: widget.tagsItems[index].isEnabled,
                      index: index,
                      elevation: 0,
                      icon: widget.tagsItems[index].icon != null
                          ? ItemTagsIcon(icon: widget.tagsItems[index].icon)
                          : null,
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                      title: widget.tagsItems[index].label,
                      textColor: widget.tagsItems[index].isEnabled
                          ? regularTextColor
                          : disabledBtnBGColor,
                      textActiveColor: enabledBtnTextColor,
                      color: bgColor,
                      activeColor: enabledBtnBGColor,
                      border: Border.all(width: 0, color: Colors.transparent),
                      active: widget.tagsItems[index].value ==
                          widget.fieldValue.toString(),
                      textStyle: normalLabelTextStyle(15, regularTextColor),
                      combine: ItemTagsCombine.withTextAfter, // OR null,
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

  Widget buildMultiTagPicker(BuildContext context) {
    return Container(
//      constraints: BoxConstraints.expand(height: 100),
//      height: 100.0,
      child: Padding(
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
                  columns: 5,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  symmetry: false,
                  itemCount: (widget.tagsItems ?? []).length,
                  itemBuilder: (int index) {
                    return ItemTags(
                      index: index,
                      elevation: 0,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      title: widget.tagsItems[index].label,
                      textColor: regularTextColor,
                      textActiveColor: enabledBtnTextColor,
                      color: bgColor,
                      activeColor: enabledBtnBGColor,
                      border: Border.all(width: 0, color: Colors.transparent),
                      active: (widget?.fieldValue
                                  ?.where((data) =>
                                      data == widget.tagsItems[index].value)
                                  ?.toList()
                                  ?.length ??
                              0) >
                          0,
                      textStyle: normalLabelTextStyle(15, regularTextColor),
                      combine: ItemTagsCombine.withTextBefore, // OR null,
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

  Widget buildTextField(BuildContext context) {
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
                child: TextField(
                  obscureText:
                      widget.isPassword == false || widget.isPassword == null
                          ? false
                          : true,
                  style: normalLabelTextStyle(
                      15,
                      (widget?.enabled ?? true)
                          ? regularTextColor
                          : Colors.black45),
                  textAlign: TextAlign.justify,
                  focusNode: widget.focusNode,
                  autofocus: widget.autoFocus,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: (val) {
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                child: TextField(
                  style: normalLabelTextStyle(
                      15,
                      (widget?.enabled ?? true)
                          ? regularTextColor
                          : Colors.black45),
                  textAlign: TextAlign.justify,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: (val) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    onSubmitted(val);
                  },
                  onEditingComplete: onEditingComplete,
                  maxLines: 1,
                  autofocus: widget.autoFocus,
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
              direction: widget.direction,
              debounceDuration: Duration(milliseconds: 200),
              hideOnError: true,
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: widget.autoFocus,
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
                final result = await fetchLocationsByQueryUseCase(
                    FetchLocationsByQueryParams(
                        query: pattern,
                        type: (widget.locationType == LocationType.Address)
                            ? "address"
                            : "establishment"));
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
                  onPointerDown: (_) => onChangedInternal(prediction),
                );
              },
              onSuggestionSelected: (suggestion) {
                onChangedInternal(suggestion);
              },
            ),
          ),
          (currentFieldValue == "")
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
                            child: (currentFieldValue != "")
                                ? Images.instance.cross()
                                : Container())),
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
              direction: widget.direction,
              debounceDuration: Duration(milliseconds: 200),
              hideOnError: true,
              loadingBuilder: (context) {
                return Container(
                  height: 100,
                  child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                        )),
                  ),
                );
              },
              textFieldConfiguration: TextFieldConfiguration(
                  autofocus: widget.autoFocus,
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
                if (pattern != null || pattern != "") {
                  final result = await widget.useCase(QueryParams(
                      query: pattern, searchFor: widget.valueSetGroup));
                  return result.fold(
                    (error) => [],
                    (success) => success,
                  );
                } else {
                  return [];
                }
              },
              itemBuilder: (context, item) {
                String displayText = "";
                if (item is HospitalList) {
                  displayText = item?.hospitalName ?? "";
                } else if (item is MedicalSchools) {
                  displayText = item?.medicalSchool ?? "";
                } else if (item is AppointmentValueSets) {
                  displayText = item?.display ?? "";
                } else {
                  displayText = item?.code?.displayName ?? "n/a";
                }
                return Listener(
                  child: ListTile(
                    title: Text(
                      displayText,
                      style: normalLabelTextStyle(15, regularTextColor),
                    ),
//                    subtitle: Text(
//                      "${prediction.terms[prediction.terms.length - 2].value}, ${prediction.terms.last.value}",
//                      style: normalLabelTextStyle(13, labelTextStyleTextColor),
//                    ),
                  ),
                  onPointerDown: (_) =>
                      (kIsWeb) ? onChangedInternal(item) : null,
                );
              },
              onSuggestionSelected: (item) {
                onChangedInternal(item);
              },
            ),
          ),
          (currentFieldValue == "" || currentFieldValue == null)
              ? Container()
              : Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                    ),
                    GestureDetector(
                        onTap: () {
                          _textEditController.clear();
                          onChangedInternal(null);
                        },
                        child: SizedBox(
                            height: 24,
                            width: 24,
                            child: (currentFieldValue != "")
                                ? Images.instance.cross()
                                : Container())),
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
                      padding: EdgeInsets.only(left: 6),
                    ),
                  ],
                ),
          Expanded(
            child: TypeAheadField(
              hideOnEmpty: true,
              debounceDuration: Duration(milliseconds: 200),
              hideOnError: true,
              direction: widget.direction,
              loadingBuilder: (context) {
                return Container(
                  height: 100,
                  child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                        )),
                  ),
                );
              },
              textFieldConfiguration: TextFieldConfiguration(
                  autofocus: widget.autoFocus,
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
                final result = await fetchValueSetsUseCase(FetchValueSetsParams(
                    request: {
                      "SearchText": pattern,
                      "SearchFor": widget.valueSetGroup,
                      "Country": ""
                    }));
                return result.fold(
                  (error) => [],
                  (success) => success,
                );
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
                  onPointerDown: (_) =>
                      (kIsWeb) ? onChangedInternal(prediction) : null,
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
                            child: (currentFieldValue != "")
                                ? Images.instance.cross()
                                : Container())),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildDateRangePickerField(BuildContext context) {
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
            child: InkWell(
              onTap: () async {
                List<DateTime> dates = [];
                if ((currentFieldValue ?? widget.fieldValue)
                    is List<DateTime>) {
                  dates = currentFieldValue;
                }
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate: ((dates?.length ?? 0) == 0)
                            ? DateTime.now()
                            : (dates?.elementAt(0) ?? DateTime.now()),
                        initialLastDate: (dates?.length ?? 0) > 1
                            ? (dates?.elementAt(1) ??
                                dates?.elementAt(0)?.add(Duration(seconds: 10)))
                            : DateTime.now().add(Duration(seconds: 10)),
                        firstDate: new DateTime(DateTime.now().year, 1, 1)
                            .subtract(Duration(days: 365 * 20)),
                        lastDate: new DateTime(DateTime.now().year, 12, 31)
                            .add(Duration(days: 365 * 20)),
                        range: DateRagePicker.DatePickerRange.multi);
                if (picked != null) {
                  print(picked);
                  onChangedInternal(picked);
                }
              },
              child: IgnorePointer(
                child: TextField(
                  obscureText:
                      widget.isPassword == false || widget.isPassword == null
                          ? false
                          : true,
                  style: normalLabelTextStyle(15, regularTextColor),
                  textAlign: TextAlign.start,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: onSubmitted,
                  onEditingComplete: onEditingComplete,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: widget.placeholder,
                      contentPadding: EdgeInsets.only(bottom: 12),
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
                      padding: EdgeInsets.only(left: 6),
                    ),
                    SizedBox(height: 24, width: 24, child: widget.rightIcon),
                  ],
                ),
        ],
      ),
    );
  }

  Widget buildDatePickerField(BuildContext context) {
    DateTime firstDate = widget.firstDate == null
        ? new DateTime.now().subtract(Duration(days: 365 * 100))
        : widget.firstDate;
    DateTime lastDate = widget.lastDate == null
        ? new DateTime.now().add(Duration(days: 365 * 100))
        : widget.lastDate;
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
            child: InkWell(
              onTap: () async {
                final List<DateTime> picked =
                    await DateRagePicker.showDatePicker(
                        context: context,
                        initialFirstDate: currentFieldValue != null
                            ? ((firstDate.isBefore(currentFieldValue) ||
                                    lastDate.isAfter(currentFieldValue))
                                ? (lastDate.isBefore(currentFieldValue)
                                    ? lastDate
                                    : (firstDate.isAfter(currentFieldValue)
                                        ? firstDate
                                        : currentFieldValue))
                                : DateTime.now())
                            : DateTime.now(),
                        initialLastDate: null,
                        firstDate: firstDate,
                        lastDate: lastDate,
                        range: DateRagePicker.DatePickerRange.single);
                if (picked != null) {
                  print(picked);
                  onChangedInternal(picked.first);
                }
              },
              child: IgnorePointer(
                child: TextField(
                  obscureText:
                      widget.isPassword == false || widget.isPassword == null
                          ? false
                          : true,
                  style: normalLabelTextStyle(15, regularTextColor),
                  textAlign: TextAlign.start,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: onSubmitted,
                  onEditingComplete: onEditingComplete,
                  decoration: InputDecoration(
                      counterText: "",
                      hintText: widget.placeholder,
                      contentPadding: EdgeInsets.only(bottom: 12),
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
                      padding: EdgeInsets.only(left: 6),
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

  Widget buildRichTextEdit(BuildContext context) {
    return Container(
      height: 80.0,
      constraints: BoxConstraints.expand(height: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: TextField(
              obscureText:
                  widget.isPassword == false || widget.isPassword == null
                      ? false
                      : true,
              style: normalLabelTextStyle(15, regularTextColor),
              textAlign: TextAlign.start,
              enabled: widget.enabled ?? true,
              maxLines: null,
              controller: _textEditController,
              autofocus: widget.autoFocus,
              onChanged: onChangedInternal,
              onSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              keyboardType: TextInputType.multiline,
              maxLength: widget.maxLength,
              minLines: 3,
              onTap: onTapInternal,
              decoration: InputDecoration(
                  //counterText: "",
                  counterStyle: normalLabelTextStyle(8, regularTextColor),
                  hintText: widget.placeholder,
                  hintStyle: defaultHintStyle(null, null),
                  contentPadding: EdgeInsets.only(bottom: -10, top: 4),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

//
