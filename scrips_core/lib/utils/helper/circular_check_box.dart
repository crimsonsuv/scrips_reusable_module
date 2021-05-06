import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

class CircularCheckBox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CircularCheckBox({Key key, this.isChecked, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
      onTap: () {
        if (onChanged != null) onChanged(!isChecked);
      },
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: isChecked ? enabledBtnBGColor : labelTextStyleTextColor),
            color: isChecked ? enabledBtnBGColor : Colors.transparent),
        child: isChecked
            ? Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
            : Container(
                height: 12,
                width: 12,
              ),
      ),
    ));
  }
}
