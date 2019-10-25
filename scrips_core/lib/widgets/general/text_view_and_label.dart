import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';

final BoxDecoration _textViewAndLabelBorder = null; // BoxDecoration(border: Border.all(color: Colors.grey));
final double _textViewAndLabelMargin = 8.0;
final double _textViewAndLabelPadding = 8.0;

class TextViewAndLabel extends StatefulWidget {
  final Color labelTextColor;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  final String labelValue;
  final String textValue;
  final bool enabled;
  final double width;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final double padding;
  final double margin;
  final bool isPassword;
  final double spaceBetweenTitle;
  // non final vars
  final String placeholder;
  final String validationMessage;
  final Function onChange;
//  _TextViewAndLabelState state;

  static _TextViewAndLabelState of(BuildContext context, {bool root = false}) => root
      ? context.rootAncestorStateOfType(const TypeMatcher<_TextViewAndLabelState>())
      : context.ancestorStateOfType(const TypeMatcher<_TextViewAndLabelState>());

  //
  TextViewAndLabel(
      {Key key,
      this.labelValue,
      this.textValue,
      this.axis,
      this.enabled,
      this.boxDecoration,
      this.padding,
      this.margin,
      this.placeholder,
      this.validationMessage,
      this.spaceBetweenTitle,
      this.isPassword,
      this.onChange,
      this.width,
      this.labelTextColor,
      this.labelBackgroundColor,
      this.fieldBackgroundColor,
      this.fieldTextColor})
      : super(key: key);

  //
  @override
  _TextViewAndLabelState createState() {
    return _TextViewAndLabelState();
  }

  String getValue(BuildContext context) {
    return TextViewAndLabel.of(context).currentTextValue;
  }

  String getValidationMessage(BuildContext context) {
    return TextViewAndLabel.of(context).currentValidationMessage;
  }
}

class _TextViewAndLabelState extends State<TextViewAndLabel> {
  //
  String currentTextValue;
  String currentPlaceholder;
  String currentValidationMessage;
  TextEditingController _controller;

  void initState() {
    super.initState();
    currentTextValue = widget.textValue ?? '';
    _controller = TextEditingController(text: currentTextValue);
    _controller.addListener(() {
      final text = _controller.text;
      setState(() {
        currentTextValue = text;
      });
      if (widget.onChange != null) {
        widget.onChange(text);
      }
    });
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
                  widget.validationMessage != null
                      ? SizedBox(
                          height: _textViewAndLabelPadding / 2,
                        )
                      : Container(),
                  Container(
                    decoration: UIHelper.defaultLabelBoxDecoration(widget.fieldBackgroundColor),
                    child: widget.validationMessage != null
                        ? PlatformText(
                            currentValidationMessage ?? widget.validationMessage ?? null,
                            style: defaultValidationStyle(null, null),
                          )
                        : Container(),
                  ),
                  SizedBox(
                    height: _textViewAndLabelPadding / 2,
                  ),
                  PlatformTextField(
                    obscureText: widget.isPassword != null ? true : false,
                    style: defaultFieldStyle(widget.fieldTextColor, widget.fieldBackgroundColor),
                    textAlign: TextAlign.start,
                    enabled: widget.enabled ?? true,
                    controller: _controller,
                    decoration: InputDecoration.collapsed(
                      border: OutlineInputBorder(),
                      hintText: currentPlaceholder ?? widget.placeholder ?? null,
                      hintStyle: defaultHintStyle(null, null),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
