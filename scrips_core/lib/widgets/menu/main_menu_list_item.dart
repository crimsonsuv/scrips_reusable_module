import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/data_models/menu/menu_item.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

final _boxDecoration = BoxDecoration(
  color: defaultMainMenuBackgroundColor,
  borderRadius: BorderRadius.circular(5.0),
//  boxShadow: [
//    BoxShadow(
//        blurRadius: 3.0,
//        offset: Offset(0.0, 2.0),
//        color: Color.fromARGB(80, 0, 0, 0))
//  ],
);

final _selectedBoxDecoration = BoxDecoration(
  color: defaultMainMenuBackgroundColor,
  borderRadius: BorderRadius.circular(5.0),
//  boxShadow: [
//    BoxShadow(
//      blurRadius: 3.0,
//      offset: Offset(0.0, 2.0),
////        color: Color.fromARGB(80, 0, 0, 0),
//    )
//  ],
);
//
final _padding = EdgeInsets.all(4.0);
final _margin = EdgeInsets.only(bottom: 8.0, left: 2.0, top: 2.0, right: 2.0);
final _iconHeight = 20.0;
final _selectedPadding = EdgeInsets.all(4.0);

class MainMenuListItem extends StatelessWidget {
  final MenuItem item;
  final bool showLabel;
  final bool center;
  final bool showIcon;
  final bool isSelected;
  final Function onTap;

  //
  const MainMenuListItem({
    this.item,
    this.onTap,
    this.showLabel,
    this.showIcon,
    this.isSelected,
    this.center,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: _margin,
              padding: this.isSelected ? _selectedPadding : _padding,
              decoration:
                  this.isSelected ? _selectedBoxDecoration : _boxDecoration,
              height: _iconHeight * 1.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  this.showIcon && this.item?.icon != null
                      ? this.item.enabled
                          ? this.item.icon
                          : Opacity(
                              opacity: 0.3,
                              child: this.item.icon,
                            )
                      : Container(),
                  this.showLabel &&
                          this.item?.label != null &&
                          this.item?.label != ''
                      ? Padding(
                          padding: EdgeInsets.only(left: 6.0, right: 6.0),
                          child: PlatformText(
                            this.item?.label ?? '',
                            style: defaultMenuItemTextStyle(
                                this.item.enabled
                                    ? Colors.white
                                    : Colors.white30,
                                null),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
