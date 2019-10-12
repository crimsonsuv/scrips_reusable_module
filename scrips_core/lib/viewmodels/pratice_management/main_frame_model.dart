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

      default:
        data.mainSubMenu = MainSubMenu(items: []);
        data.mainSubMenu.currentItem = null;
    }
    this.loadContainedItems(data);
  }

  List<Widget> loadContainedItems(MainFrame data) {
    setBusy(true);
    String mainMenuId = data?.mainMenu?.currentItem?.id;
    String mainSubMenuId = data?.mainSubMenu?.currentItem?.id;
    switch (mainMenuId) {
      case '1':
        switch (mainSubMenuId) {
          case '1':
            this.data.containedItems = [ContainedItem11()];
            break;
          case '2':
            this.data.containedItems = [ContainedItem12()];
            break;
          case '3':
            this.data.containedItems = [ContainedItem13()];
            break;
          default:
            this.data.containedItems = [ContainedItemEmpty()];
            break;
        }
        break;

      case '2':
        switch (mainSubMenuId) {
          case '1':
            this.data.containedItems = [ContainedItem21()];
            break;
          case '2':
            this.data.containedItems = [ContainedItem22()];
            break;
          case '3':
            this.data.containedItems = [ContainedItem23()];
            break;
          default:
            this.data.containedItems = [ContainedItemEmpty()];
            break;
        }
        break;

      default:
        this.data.containedItems = [ContainedItemEmpty()];
        break;
    }
    setBusy(false);
  }

  void setCurrentMainMenuItem(MenuItem item) {
    setBusy(true);
    this.data.mainMenu.currentItem = item;
    this.loadSubMenuItems(data);
    setBusy(false);
  }

  void setCurrentMainSubMenuItem(MenuItem item) {
    setBusy(true);
    this.data.mainSubMenu.currentItem = item;
    this.loadContainedItems(data);
    setBusy(false);
  }
}

class ContainedItem11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 11',
          textValue: 'Contained Text 11',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 2',
          textValue: 'Contained Text 2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 3',
          textValue: 'Contained Text 3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItemEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label Empty',
          textValue: 'Contained Text Empty',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label Empty',
          textValue: 'Contained Text Empty',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label Empty',
          textValue: 'Contained Text Empty',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItem12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 12',
          textValue: 'Contained Text 12',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 12',
          textValue: 'Contained Text 12',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 3',
          textValue: 'Contained Text 3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItem13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 13',
          textValue: 'Contained Text 13',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 13',
          textValue: 'Contained Text 13',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 13',
          textValue: 'Contained Text 13',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItem21 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 21',
          textValue: 'Contained Text 21',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 2',
          textValue: 'Contained Text 2',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 3',
          textValue: 'Contained Text 3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItem22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 22',
          textValue: 'Contained Text 22',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 22',
          textValue: 'Contained Text 22',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 3',
          textValue: 'Contained Text 3',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}

class ContainedItem23 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextViewAndLabel(
          labelValue: 'Label 23',
          textValue: 'Contained Text 23',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 23',
          textValue: 'Contained Text 23',
          axis: Axis.horizontal,
          enabled: true,
        ),
        TextViewAndLabel(
          labelValue: 'Label 23',
          textValue: 'Contained Text 23',
          axis: Axis.horizontal,
          enabled: true,
        ),
      ],
    );
  }
}
