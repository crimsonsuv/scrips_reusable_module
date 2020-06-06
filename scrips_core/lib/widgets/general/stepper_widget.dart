import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

class CountStepper extends StatelessWidget {
  CountStepper(
      {Key key, this.increment, this.decrement, this.height, this.width})
      : super(key: key);
  final Function increment;
  final Function decrement;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: bgColor,
        border: Border.all(color: bgColor, width: 1),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(4), topLeft: Radius.circular(4)),
              child: InkWell(
                onTap: this.decrement,
                child: Container(
                  color: bgColor,
                  child: Center(
                    child: Images.instance.minusStepper(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(
              width: 1,
              color: disabledBtnBGColor,
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  topRight: Radius.circular(4)),
              child: InkWell(
                onTap: this.increment,
                child: Container(
                  color: bgColor,
                  child: Center(
                    child: Images.instance.plusStepper(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
