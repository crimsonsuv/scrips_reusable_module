import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

final BoxDecoration _textViewAndLabelBorder = null; // BoxDecoration(border: Border.all(color: Colors.grey));
final double _textViewAndLabelMargin = 8.0;
final double _textViewAndLabelPadding = 8.0;

class TextViewAndLabel extends StatefulWidget {
  final String labelValue;
  final String textValue;
  final bool enabled;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final double padding;
  final double margin;
  final bool isPassword;
  final double spaceBetweenTitle;
  // non final vars
  final String placeholder;
  final String validationMessage;
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
      this.isPassword})
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
    _controller = TextEditingController(text: this.widget.textValue);
    _controller.addListener(() {
      final text = _controller.text;
      this.setState(() {
        this.currentTextValue = text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(this.widget.padding ?? _textViewAndLabelPadding),
          margin: EdgeInsets.all(this.widget.margin ?? _textViewAndLabelMargin),
          decoration: this.widget.boxDecoration ?? _textViewAndLabelBorder,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PlatformText(
                  this.widget.labelValue,
                  style: defaultTextStyle,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: _textViewAndLabelPadding / 2,
                ),
                this.widget.validationMessage != null
                    ? SizedBox(
                        height: _textViewAndLabelPadding / 2,
                      )
                    : Container(),
                this.widget.validationMessage != null
                    ? PlatformText(
                        this.currentValidationMessage ?? this.widget.validationMessage ?? null,
                        style: defaultValidationTextStyle,
                      )
                    : Container(),
                SizedBox(
                  height: _textViewAndLabelPadding / 2,
                ),
                PlatformTextField(
                  obscureText: this.widget.isPassword != null ? true : false,
                  style: defaultTextEditStyle,
                  textAlign: TextAlign.start,
                  enabled: this.widget.enabled ?? true,
                  controller: TextEditingController(text: this.widget.textValue ?? this.currentTextValue),
                  decoration: InputDecoration.collapsed(
                    border: OutlineInputBorder(),
                    hintText: this.currentPlaceholder ?? this.widget.placeholder ?? null,
                    hintStyle: defaultTetEditHintStyle,
                  ),
                )
              ]),
        ),
      ],
    );
  }
}
