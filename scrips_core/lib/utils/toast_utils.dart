import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';

class ToastUtils {
  static showToast(BuildContext context,
      {Duration duration,
      String message,
      Color backgroundColor,
      Color textColor,
      ToastPosition position}) {
    showToastWidget(
      ToastWidget(
        message: message ?? "",
        backgroundColor: backgroundColor ?? scripsPrimaryLightBlueColor,
        textColor: textColor,
      ),
      position: position ?? ToastPosition.top,
      context: context,
      duration: duration ?? Duration(seconds: 4),
    );
  }

  static showErrorToast(BuildContext context,
      {String message, ToastPosition position}) {
    showToast(context,
        message: message, backgroundColor: red, position: position);
  }

  static showInfoToast(BuildContext context,
      {String message, ToastPosition position}) {
    showToast(context,
        message: message,
        backgroundColor: gradientColor1,
        textColor: Colors.black,
        position: position);
  }
}
