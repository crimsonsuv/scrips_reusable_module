import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_typeahead_web/flutter_typeahead.dart';
import 'package:scrips_core/common/data/datamodels/locations_model.dart';
import 'package:scrips_core/common/domain/usecases/fetch_locations_by_query_use_case.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/di/dependency_injection.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';
import 'package:scrips_core/utils/utils.dart';

enum FieldType {
  TextField,
  DropDownList,
  List,
  RichText,
  RichTextEdit,
  DatePicker,
  DateRangePicker,
  LocationPicker,
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
  final PropertyInfo fieldProperty;
  final bool enabled;
  final double width;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final bool isPassword;
  final bool isMandatory;
  final bool wrapWithRow;
  final double spaceBetweenTitle;
  final String placeholder;
  final String validationMessage;
  final TextCapitalization labelTextCapitalization;
  final Function onChanged;
  final Function onEditingComplete;
  final Function onSubmitted;
  final Function onTap;
  final Widget icon;
  final Widget rightIcon;

  final List<ListItemType> listItems;
  FieldAndLabelState _myState;

  //
  FieldAndLabel(
      {Key key,
      this.labelValue,
      this.labelTextCapitalization = TextCapitalization.characters,
      this.labelTextStyle,
      this.fieldValue,
      this.fieldProperty,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onTap,
      this.fieldType = FieldType.TextField,
      this.listItems,
      this.icon,
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

  //  ZefyrController _richTextEditController;
  //  FocusNode _richTextEditFocusNode;

  void initState() {
    super.initState();
    fetchLocationsByQueryUseCase =
        FetchLocationsByQueryUseCase(repository: coreSl());

    currentFieldValue = widget.fieldProperty != null
        ? widget.fieldProperty?.value
        : (widget.fieldValue ?? null);

    if (widget.fieldType == FieldType.TextField ||
        widget.fieldType == FieldType.LocationPicker) {
      // a controller is needed to Set initial value for textfield
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
                "${scDateFormat(dates.elementAt(0))} - ${scDateFormat(dates.elementAt(1))}");
      } else if (dates.length == 1) {
        _textEditController =
            TextEditingController(text: scDateFormat(dates.elementAt(0)));
      } else {
        _textEditController = TextEditingController(text: "");
      }
    } else if (widget.fieldType == FieldType.DatePicker) {
      _textEditController =
          TextEditingController(text: scDateFormat(currentFieldValue));
    }
  }

  onChangedInternal(value) {
//    debugLog('onChangedInternal $value');
//    setState(() {
    currentFieldValue = value;
    if (widget.fieldProperty != null) {
      widget.fieldProperty.value = currentFieldValue;
    }
//    });
    if (widget.onChanged != null) {
      // also pass this so UI can call methods such as setValidationMessage
      widget.onChanged(value, this);
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
              PlatformText(
                widget.labelValue,
                style: this.widget.labelTextStyle ??
                    defaultLabelStyle(
                        widget.labelTextColor, widget.labelBackgroundColor),
                textAlign: TextAlign.start,
                textCapitalization: this.widget.labelTextCapitalization ??
                    TextCapitalization.characters,
              ),
              this.widget.isMandatory
                  ? SizedBox(
                      width: UIHelper.defaultFieldAndLabelPaddingSize / 2,
                    )
                  : Container(),
              this.widget.isMandatory
                  ? PlatformText(
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
      default:
        field = Container();
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(
            color: widget.fieldBackgroundColor ?? defaultFieldBackgroundColor),
        color: widget.fieldBackgroundColor,
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
            child: DropdownButton(
              underline: Container(),
              isExpanded: true,
              value: currentFieldValue ?? widget.fieldValue,
              items: widget.listItems ?? [],
              icon: Images.instance.dropDownIcon(height: 24, width: 24),
              iconSize: 12.0,
              onChanged: onChangedInternal,
              style: normalLabelTextStyle(15, regularTextColor),
              hint: PlatformText(widget.placeholder ?? '',
                  style: defaultHintStyle(null, null)),
              disabledHint: PlatformText(widget.validationMessage ?? '',
                  style: defaultHintStyle(null, null)),
            ),
          )
        ],
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
                  style: normalLabelTextStyle(15, regularTextColor),
                  textAlign: TextAlign.justify,
                  enabled: widget.enabled ?? true,
                  controller: _textEditController,
                  onChanged: onChangedInternal,
                  onSubmitted: onSubmitted,
                  onEditingComplete: onEditingComplete,
                  maxLines: 1,
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
              debounceDuration: Duration(milliseconds: 200),
              hideOnError: true,
              textFieldConfiguration: TextFieldConfiguration(
                autofocus: false,
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
                    FetchLocationsByQueryParams(query: pattern));
                return result.fold(
                  (error) => [],
                  (success) => success.predictions,
                );
              },
              itemBuilder: (context, prediction) {
                return ListTile(
                  title: Text(
                    prediction.description,
                    style: normalLabelTextStyle(15, regularTextColor),
                  ),
                  subtitle: Text(
                    "${prediction.terms[prediction.terms.length - 2].value}, ${prediction.terms.last.value}",
                    style: normalLabelTextStyle(13, labelTextStyleTextColor),
                  ),
                );
              },
              onSuggestionSelected: (suggestion) {
                onChangedInternal(suggestion);
              },
            ),
          ),
          (widget.rightIcon == null)
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
                                : widget.rightIcon)),
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
                                DateTime.now().add(Duration(seconds: 10)))
                            : DateTime.now().add(Duration(seconds: 10)),
                        firstDate: new DateTime.now()
                            .subtract(Duration(days: 365 * 20)),
                        lastDate:
                            new DateTime.now().add(Duration(days: 365 * 20)),
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
                        initialFirstDate: currentFieldValue ?? DateTime.now(),
                        initialLastDate: null,
                        firstDate: new DateTime.now()
                            .subtract(Duration(days: 365 * 20)),
                        lastDate:
                            new DateTime.now().add(Duration(days: 365 * 20)),
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
      height: 60.0,
      constraints: BoxConstraints.expand(height: 60),
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
              onChanged: onChangedInternal,
              onSubmitted: onSubmitted,
              onEditingComplete: onEditingComplete,
              keyboardType: TextInputType.multiline,
              minLines: 2,
              onTap: () {
                onTapInternal();
              },
              decoration: InputDecoration(
                  counterText: "",
                  hintText: widget.placeholder,
                  hintStyle: defaultHintStyle(null, null),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}

//
