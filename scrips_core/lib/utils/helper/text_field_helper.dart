import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

import '../helper/text_style_helper.dart';

InputDecoration noBorderTextInputDecoration(String hint,
        {TextStyle hintStyle}) =>
    InputDecoration(
        border: InputBorder.none,
        labelStyle:
            editTextHintTextStyle().copyWith(color: scripsTextBlueColor),
        hintStyle: hintStyle ?? editTextHintTextStyle(),
        contentPadding: EdgeInsets.all(0),
        counterText: "",
        isDense: true,
        hintText: hint);

InputDecoration defaultTextInputDecoration(String hint,
        {TextStyle hintStyle, labelStyle, bool hasBorder = false}) =>
    InputDecoration(
        border: hasBorder ? null : InputBorder.none,
        focusedBorder: hasBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: separatorColor))
            : InputBorder.none,
        enabledBorder: hasBorder
            ? UnderlineInputBorder(
                borderSide: BorderSide(color: separatorColor))
            : InputBorder.none,
        labelStyle: labelStyle ??
            editTextHintTextStyle().copyWith(color: scripsTextBlueColor),
        hintStyle: hintStyle ?? editTextHintTextStyle(),
        contentPadding: EdgeInsets.only(bottom: hasBorder ? 3 : 0, right: 0, left: 0,top: 0),
        isDense: true,
        counterText: "",
        hintText: hint);
