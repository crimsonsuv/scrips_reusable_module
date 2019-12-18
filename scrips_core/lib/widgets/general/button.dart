import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget {
  final Color buttonBackgroundColor;
  final String text;
  final double width;
  final double height;
  final Function onPressed;
  final TextStyle style;
  //
  Button({
    Key key,
    this.text,
    this.buttonBackgroundColor,
    this.width,
    this.height,
    this.onPressed,
    this.style,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.height),
      child: Material(
          color: this.buttonBackgroundColor,
        child: InkWell(
          onTap: (){
            this.onPressed();
          },
          child: Container(
            height: this.height,
            width: this.width,
            child: Center(
              child: Text(this.text, style: this.style,),
            ),
          ),
        )
      ),
    );
  }
}
