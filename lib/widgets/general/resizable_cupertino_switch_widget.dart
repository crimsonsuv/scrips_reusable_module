import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef BoolCallback(bool status);

class SizedCupertinoSwitch extends StatelessWidget {
  SizedCupertinoSwitch(
      {Key key,
      @required this.width,
      @required this.height,
      this.scale = 1,
      this.onChanged,
      this.value})
      : super(key: key);
  final double width;
  final double height;
  final double scale;
  final BoolCallback onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: Transform.scale(
        scale: this.scale,
        child: CupertinoSwitch(
          value: this.value,
          onChanged: (status) {
            onChanged(status);
          },
        ),
      ),
    );
  }
}
