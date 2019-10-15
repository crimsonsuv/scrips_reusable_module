import 'package:flutter/cupertino.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_sub_menu.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:flutter/material.dart';

import '../../datamodels/pratice_management/main_frame.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class MainFrameModel extends BaseModel {
  MainFrame data = MainFrame();

  MainFrameModel();

  Future loadData({int userId}) async {
    setBusy(true);
    data = MainFrame();
    //posts = await _api.getPostsForUser(userId);
    this.loadMainMenuItems(data);
    //
    setBusy(false);
  }

  void loadMainMenuItems(MainFrame data) {
    data.mainMenu = MainMenu(items: [
      MenuItem(id: '1', label: 'item 1', name: 'item_1', icon: Icons.directions_car, enabled: true),
      MenuItem(
          id: '2', label: 'item 2', name: 'item_2', icon: Icons.directions_bike, enabled: false),
      MenuItem(
          id: '3', label: 'item 3', name: 'item_3', icon: Icons.directions_walk, enabled: true),
    ]);
    data.mainMenu.currentItem = data.mainMenu.items[0];
    this.loadSubMenuItems(data);
  }

  void loadSubMenuItems(MainFrame data) {
    String mainMenuId = data?.mainMenu?.currentItem?.id;
    switch (mainMenuId) {
      case '1':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '1',
              label: 'subitem 1',
              name: 'subitem_1',
              icon: Icons.directions_boat,
              enabled: true),
          MenuItem(
              id: '2',
              label: 'subitem 2',
              name: 'subitem_2',
              icon: Icons.directions_bus,
              enabled: false),
          MenuItem(
              id: '3',
              label: 'subitem 3',
              name: 'subitem_3',
              icon: Icons.directions_subway,
              enabled: true),
        ]);
        data.mainSubMenu.currentItem = data.mainSubMenu.items[0];
        break;

      case '2':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '4',
              label: 'subitem 4',
              name: 'subitem_4',
              icon: Icons.directions_railway,
              enabled: true),
          MenuItem(
              id: '5',
              label: 'subitem 5',
              name: 'subitem_5',
              icon: Icons.directions_transit,
              enabled: false),
          MenuItem(
              id: '6',
              label: 'subitem 6',
              name: 'subitem_6',
              icon: Icons.directions_run,
              enabled: true),
        ]);
        data.mainSubMenu.currentItem = data.mainSubMenu.items[0];
        break;
      case '3':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '7',
              label: 'subitem 8',
              name: 'subitem_8',
              icon: Icons.accessibility,
              enabled: true),
          MenuItem(
              id: '9',
              label: 'subitem 9',
              name: 'subitem_9',
              icon: Icons.battery_alert,
              enabled: false),
          MenuItem(
              id: '10',
              label: 'subitem 10',
              name: 'subitem_10',
              icon: Icons.calendar_today,
              enabled: true),
        ]);
        data.mainSubMenu.currentItem = data.mainSubMenu.items[0];
        break;

      default:
        data.mainSubMenu = MainSubMenu(items: []);
        data.mainSubMenu.currentItem = null;
    }
    this.loadContainedItems(data);
  }

  void loadContainedItems(MainFrame data) {
    setBusy(true);
    String mainMenuId = data?.mainMenu?.currentItem?.id;
    String mainSubMenuId = data?.mainSubMenu?.currentItem?.id;
    this.data.containedItems = [ContainedItem(suffix: '${mainMenuId}-${mainSubMenuId}')];
    //
    setBusy(false);
  }

  void setCurrentMainMenuItem(MenuItem item) {
    setBusy(true);
    this.data.mainMenu.currentItem = item;
    this.loadSubMenuItems(data);
    this.data.mainSubMenuVisible = true;
    setBusy(false);
  }

  void setCurrentMainSubMenuItem(MenuItem item, bool hideOnSelect) {
    setBusy(true);
    this.data.mainSubMenu.currentItem = item;
    if (hideOnSelect) {
      this.data.mainSubMenuVisible = false;
    }
    this.loadContainedItems(data);
    setBusy(false);
  }

  void toggleSubMenuVisible() {
    setBusy(true);
    // whether to show or not
    this.data.mainSubMenuVisible = !this.data.mainSubMenuVisible;
    // whether to animate on next show
    this.data.mainSubMenuStartShowing = this.data.mainSubMenuVisible;
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
