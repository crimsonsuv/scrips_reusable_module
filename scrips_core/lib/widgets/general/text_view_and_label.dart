import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

final BoxDecoration _TextViewAndLabelBorder =
    null; // BoxDecoration(border: Border.all(color: Colors.grey));
final double _TextViewAndLabelMargin = 8.0;
final double _TextViewAndLabelPadding = 8.0;

class TextViewAndLabel extends StatefulWidget {
  final String labelValue;
  final String textValue;
  final bool enabled;
  final Axis axis;
  final BoxDecoration boxDecoration;
  final double padding;
  final double margin;
  _TextViewAndLabelState state;

  //
  TextViewAndLabel(
      {Key key,
      this.labelValue,
      this.textValue,
      this.axis,
      this.enabled,
      this.boxDecoration,
      this.padding,
      this.margin})
      : super(key: key);

  //
  @override
  _TextViewAndLabelState createState() {
    this.state = _TextViewAndLabelState();
    return this.state;
  }

  String getValue() {
    return this.state.currentTextValue;
  }
}

class _TextViewAndLabelState extends State<TextViewAndLabel> {
  //
  String currentTextValue;
  TextEditingController _controller;

  void initState() {
    _controller = TextEditingController(text: this.widget.textValue);
    _controller.addListener(() {
      final text = _controller.text;
      this.setState(() {
        currentTextValue = text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(this.widget.padding ?? _TextViewAndLabelPadding),
      margin: EdgeInsets.all(this.widget.margin ?? _TextViewAndLabelMargin),
      decoration: this.widget.boxDecoration ?? _TextViewAndLabelBorder,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PlatformText(this.widget.labelValue),
          PlatformTextField(
            enabled: this.widget.enabled ?? true,
            controller: TextEditingController(text: this.widget.textValue),
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
