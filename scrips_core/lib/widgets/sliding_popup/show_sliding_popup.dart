import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/sliding_popup/sliding_popup_view.dart';

class SlidingPopup {
  static show({
    BuildContext context,
    Widget child,
    Color background,
    String title,
    double width,
    Function onSave,
  }) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => SlidingPopupWidget(
              width: width,
              title: title,
              child: child,
              onSave: onSave,
              background: background,
            ));
  }
}
