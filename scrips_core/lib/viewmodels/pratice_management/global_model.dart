import 'package:flutter/cupertino.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_sub_menu.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:scrips_pm/constants/app_routes.dart';
import '../../datamodels/pratice_management/global.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class GlobalModel extends BaseModel {
  Global data;
  final BuildContext context;
  //
  GlobalModel(this.context, {String userId})
      : data = Global(userId: userId),
        super();

  Future init() async {}

  void toggleShowOverlappedSubMenu(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.showOverlappedSubMenu = !this.data.showOverlappedSubMenu;
    this.data.statusText =
        this.data.showOverlappedSubMenu ? 'Showing Overlapped Menu' : 'Showing Fixed Menu';

    setBusy(false);
  }

  void toggleAnimateSubMenu(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.animateSubMenu = !this.data.animateSubMenu;
    this.data.statusText =
        this.data.animateSubMenu ? 'Showing Animated Menu' : 'Showing Non Animated Menu';

    setBusy(false);
  }

  void setStatusText(String value) {
    setBusy(true);
    // whether to show or not
    this.data.statusText = value;
    setBusy(false);
  }
}

class ContainedItem extends StatelessWidget {
  final String suffix;
  //
  ContainedItem({Key key, this.suffix}) : super(key: key);
  //
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label $suffix-1',
          textValue: 'Contained Text $suffix-1',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label $suffix-2',
          textValue: 'Contained Text $suffix-2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label $suffix-3',
          textValue: 'Contained Text $suffix-3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}
