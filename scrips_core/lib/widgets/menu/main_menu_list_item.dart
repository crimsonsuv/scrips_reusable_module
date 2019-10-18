import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';

final _boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(blurRadius: 3.0, offset: Offset(0.0, 2.0), color: Color.fromARGB(80, 0, 0, 0))
    ]);

final _padding = EdgeInsets.all(1.0);
final _selectedBoxDecoration = BoxDecoration(
    color: Colors.green,
    borderRadius: BorderRadius.circular(5.0),
    boxShadow: [
      BoxShadow(blurRadius: 3.0, offset: Offset(0.0, 2.0), color: Color.fromARGB(80, 0, 0, 0))
    ]);
final _selectedPadding = EdgeInsets.all(1.0);

class MainMenuListItem extends StatelessWidget {
  final MenuItem item;
  final bool showLabel;
  final bool center;
  final bool showIcon;
  final bool isSelected;
  final Function onTap;
  //
  const MainMenuListItem(
      {this.item, this.onTap, this.showLabel, this.showIcon, this.isSelected, this.center})
      : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
            padding: this.isSelected ? _selectedPadding : _padding,
            decoration: this.isSelected ? _selectedBoxDecoration : _boxDecoration,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment: this.center ? MainAxisAlignment.center : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  this.showIcon && this.item?.icon != null ? Icon(this.item?.icon) : Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 6.0),
                    child: this.showLabel
                        ? PlatformText(
                            this.item?.label ?? '',
                            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
