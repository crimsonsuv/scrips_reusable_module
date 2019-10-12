import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';

class MainMenuListItem extends StatelessWidget {
  final MenuItem item;
  final Function onTap;
  const MainMenuListItem({this.item, this.onTap}) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0, offset: Offset(0.0, 2.0), color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            this.item?.icon != null ? Icon(this.item?.icon) : Container(),
//            PlatformText(
//              this.item?.label ?? '',
//              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
//            ),
          ],
        ),
      ),
    );
  }
}
