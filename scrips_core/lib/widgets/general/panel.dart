import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  final String suffix;
  final Color emptyBackgroundColor;
  final Color panelBackgroundColor;

  final Color labelTextColor;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  //
  Panel(
      {Key key,
      this.suffix,
      this.emptyBackgroundColor,
      this.panelBackgroundColor,
      this.labelBackgroundColor,
      this.labelTextColor,
      this.fieldBackgroundColor,
      this.fieldTextColor})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
