import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

class Button extends StatelessWidget {
  final Color buttonBackgroundColor;
  final String text;
  final double width;
  final double height;
  final double minWidth;
  final double radius;
  final Function onPressed;
  final Function onTapDownDetails;
  final TextStyle style;
  final bool isLoading;
  final EdgeInsets padding;
  final Color loaderColor;
  final bool enable;

  //
  Button(
      {Key key,
      this.text,
      this.buttonBackgroundColor,
      this.width,
      this.minWidth = 0,
      this.height = 32,
      this.radius = 0.0,
      this.onPressed,
        this.onTapDownDetails,
      this.style,
      this.padding = EdgeInsets.zero,
      this.isLoading = false,
      this.loaderColor = enabledBtnTextColor,
      this.enable = true})
      : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular((this.radius == 0.0) ? this.height : this.radius),
      child: Material(
          color: enable ? this.buttonBackgroundColor : disabledBtnBGColor,
          child: InkWell(
            onTap: (this.isLoading || !enable)
                ? null
                : () {
                    this.onPressed();
                  },
            onTapDown: (TapDownDetails tapDetails){
              if(onTapDownDetails!=null)this.onTapDownDetails(tapDetails);
            },
            child: Container(
              height: this.height,
              width: this.width,
              constraints: BoxConstraints(minWidth: this.minWidth),
              padding: padding,
              child: Center(
                child: this.isLoading
                    ? SizedBox(
                        height: height * 0.6,
                        width: height * 0.6,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
                        ))
                    : Text(
                        this.text,
                        style: this.style,
                      ),
              ),
            ),
          )),
    );
  }
}
