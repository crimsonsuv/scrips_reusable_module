import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';


class Button extends StatelessWidget {
  final Color buttonBackgroundColor;
  final String text;
  final double width;
  final double height;
  final Function onPressed;
  final TextStyle style;
  final bool isLoading;
  //
  Button({
    Key key,
    this.text,
    this.buttonBackgroundColor,
    this.width,
    this.height,
    this.onPressed,
    this.style,
    this.isLoading = false,
  }) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(this.height),
      child: Material(
          color: this.buttonBackgroundColor,
        child: InkWell(
          onTap: (this.isLoading) ? null : (){
             this.onPressed();
          },
          child: Container(
            height: this.height,
            width: this.width,
            child: Center(
              child: this.isLoading ? SizedBox(height: height*0.6, width: height*0.6,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(enabledBtnTextColor),)) : Text(this.text, style: this.style,),
            ),
          ),
        )
      ),
    );
  }
}
