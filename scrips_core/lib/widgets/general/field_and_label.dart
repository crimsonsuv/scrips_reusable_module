import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';

final BoxDecoration _textViewAndLabelBorder = null; // BoxDecoration(border: Border.all(color: Colors.grey));
final double _textViewAndLabelMargin = 8.0;
final double _textViewAndLabelPadding = 8.0;

enum FieldType { TextField, DropDownList, List, RichEdit }

class FieldAndLabel<ListItemType> extends StatefulWidget {
  final FieldType fieldType;
  final Color labelTextColor;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  final String labelValue;
  final dynamic fieldValue;
  final bool enabled;
  final double width;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final double padding;
  final double margin;
  final bool isPassword;
  final double spaceBetweenTitle;
  final String placeholder;
  final String validationMessage;
  final Function onChanged;
  final List<ListItemType> listItems;
//  _TextViewAndLabelState state;

  //
  FieldAndLabel(
      {Key key,
      @required this.labelValue,
      @required this.fieldValue,
      @required this.onChanged,
      this.fieldType = FieldType.TextField,
      this.listItems,
      this.axis,
      this.enabled = true,
      this.boxDecoration,
      this.padding,
      this.margin,
      this.placeholder,
      this.validationMessage,
      this.spaceBetweenTitle,
      this.isPassword = false,
      this.width,
      this.labelTextColor,
      this.labelBackgroundColor,
      this.fieldBackgroundColor,
      this.fieldTextColor})
      : super(key: key);

  static _FieldAndLabelState of(BuildContext context, {bool root = false}) => root
      ? context.rootAncestorStateOfType(const TypeMatcher<_FieldAndLabelState>())
      : context.ancestorStateOfType(const TypeMatcher<_FieldAndLabelState>());

  //
  @override
  _FieldAndLabelState createState() {
    return _FieldAndLabelState();
  }

  String getValue(BuildContext context) {
    return FieldAndLabel.of(context).currentFieldValue;
  }

  String getValidationMessage(BuildContext context) {
    return FieldAndLabel.of(context).currentValidationMessage;
  }
}

class _FieldAndLabelState extends State<FieldAndLabel> {
  //
  var currentFieldValue;
  String currentPlaceholder;
  String currentValidationMessage;
  TextEditingController _textEditController;

  void initState() {
    super.initState();
    currentFieldValue = widget.fieldValue ?? null;
    if (widget.fieldType == FieldType.TextField) {
      _textEditController = TextEditingController(text: currentFieldValue);
    }
  }

  onChangedInternal(value) {
    debugPrint(value);
    setState(() {
      currentFieldValue = value;
    });
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width != null && widget.width > 0 ? widget.width : double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(widget.padding ?? _textViewAndLabelPadding),
            margin: EdgeInsets.all(widget.margin ?? _textViewAndLabelMargin),
            decoration: widget.boxDecoration ?? _textViewAndLabelBorder,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    decoration: UIHelper.defaultLabelBoxDecoration(widget.labelBackgroundColor),
                    child: PlatformText(
                      widget.labelValue,
                      style: defaultLabelStyle(widget.labelTextColor, widget.labelBackgroundColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: _textViewAndLabelPadding / 2,
                  ),
                  widget.validationMessage != null && widget.fieldType != FieldType.DropDownList
                      ? Column(
                          children: [
                            SizedBox(
                              height: _textViewAndLabelPadding / 2,
                            ),
                            Container(
                                decoration: UIHelper.defaultLabelBoxDecoration(widget.fieldBackgroundColor),
                                child: PlatformText(
                                  currentValidationMessage ?? widget.validationMessage ?? null,
                                  style: defaultValidationStyle(null, null),
                                )),
                            SizedBox(
                              height: _textViewAndLabelPadding / 2,
                            )
                          ],
                        )
                      : Container(),
                  widget.fieldType == FieldType.TextField
                      ? PlatformTextField(
                          obscureText: widget.isPassword != null ? true : false,
                          style: defaultFieldStyle(widget.fieldTextColor, widget.fieldBackgroundColor),
                          textAlign: TextAlign.start,
                          enabled: widget.enabled ?? true,
                          controller: _textEditController,
                          onChanged: onChangedInternal,
                          decoration: InputDecoration.collapsed(
                            border: OutlineInputBorder(),
                            hintText: currentPlaceholder ?? widget.placeholder ?? null,
                            hintStyle: defaultHintStyle(null, null),
                          ),
                        )
                      : Container(),
                  widget.fieldType == FieldType.DropDownList
                      ? DropdownButton(
                          value: currentFieldValue ?? widget.fieldValue,
                          items: widget.listItems ?? [],
                          onChanged: onChangedInternal,
                          style: defaultFieldStyle(widget.fieldTextColor, widget.fieldBackgroundColor),
                          isExpanded: false,
                          hint: PlatformText(widget.placeholder ?? ''),
                          disabledHint: PlatformText(widget.validationMessage ?? ''),
                        )
                      : Container(),
                ]),
          ),
        ],
      ),
    );
  }
}
