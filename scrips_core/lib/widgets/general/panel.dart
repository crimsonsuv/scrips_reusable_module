import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import '../../widgets/general/text_view_and_label.dart';

class Panel extends StatelessWidget {
  final String suffix;
  final Color labelTextColor;
  final Color labelBackgroundColor;
  final Color fieldBackgroundColor;
  final Color fieldTextColor;
  //
  Panel(
      {Key key, this.suffix, this.labelBackgroundColor, this.labelTextColor, this.fieldBackgroundColor, this.fieldTextColor})
      : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
