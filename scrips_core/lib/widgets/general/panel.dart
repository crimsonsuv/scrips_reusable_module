import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/ui_helpers.dart';

class Panel extends StatelessWidget {
  final Color panelBackgroundColor;
  final List<Widget> children;
  //
  Panel({
    Key key,
    this.children,
    this.panelBackgroundColor,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIHelper.defaultPanelPadding,
      margin: UIHelper.defaultPanelMargin,
//      decoration: UIHelper.defaultPanelBorder,
      child: Column(children: <Widget>[
        Container(
//          decoration: BoxDecoration(color: this.panelBackgroundColor ?? defaultPanelBackgroundColor),
          child: Column(
            children: this.children,
          ),
        ),
      ]),
    );
  }
}
