import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/sliding_popup/sliding_popup_view.dart';

class SlidingPopup {
  static show(
      {BuildContext context,
      Color backgroundColor,
      Widget child,
      String title,
      double width,
      Function onSave}) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        fullscreenDialog: true,
        pageBuilder: (BuildContext context, _, __) {
          return SlidingPopupWidget(
            width: width,
            title: title,
            child: child,
            onSave: onSave,
            backgroundColor: backgroundColor,
          );
        }
    ));

  }
}
