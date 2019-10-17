import 'package:flutter/cupertino.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_sub_menu.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/widgets/menu/main_menu_list_item.dart';
import 'package:scrips_pm/constants/app_routes.dart';
import '../../datamodels/pratice_management/main_frame.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class MainFrameModel extends BaseModel {
  MainFrame data;

//
  MainFrameModel({String userId, String mainMenuPath, String mainSubMenuPath})
      : data =
            MainFrame(userId: userId, mainMenuPath: mainMenuPath, mainSubMenuPath: mainSubMenuPath),
        super();

  Future init() async {
    setBusy(true);

    //posts = await _api.getPostsForUser(userId);
    this.loadMainMenuItems(data);
    //
    setBusy(false);
  }

  void loadMainMenuItems(MainFrame data) {
    //sumeet: note: this will call API.loadMenuItems for current userId
    data.mainMenu = MainMenu(items: [
      MenuItem(id: RoutePaths.Home, label: 'Home', icon: Icons.home, enabled: true),
      MenuItem(
          id: RoutePaths.PracticeOnBoardingWizard,
          label: 'Onboard Pratice',
          icon: Icons.stars,
          enabled: true),
      MenuItem(id: RoutePaths.Settings, label: 'Settings', icon: Icons.settings, enabled: true),
    ]);
    //
    data.mainMenu.currentItem =
        this.getMenuItemForId(items: this.data.mainMenu.items, id: this.data.mainMenuPath);
    this.loadSubMenuItems(data);
  }

  MenuItem getMenuItemForId({List<MenuItem> items, String id}) {
    if (items != null && items.length > 0) {
      for (MenuItem item in items) {
        // for null id, return first enabled item
        if ((id == null || id == '') && item.enabled) {
          return item;
          // for nonnull id, return first matching enabled item
        } else if (item.id == id && item.enabled) {
          return item;
        }
      }
    }
    return null;
  }

  void loadSubMenuItems(MainFrame data) {
    String mainMenuId = data?.mainMenu?.currentItem?.id;
    switch (mainMenuId) {
      case '1':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(id: '1', label: 'subitem 1', icon: Icons.directions_boat, enabled: true),
          MenuItem(id: '2', label: 'subitem 2', icon: Icons.directions_bus, enabled: false),
          MenuItem(id: '3', label: 'subitem 3', icon: Icons.directions_subway, enabled: true),
        ]);
        data.mainSubMenu.currentItem = data.mainSubMenu.items[0];
        break;

      case '2':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(id: '4', label: 'subitem 4', icon: Icons.directions_railway, enabled: true),
          MenuItem(id: '5', label: 'subitem 5', icon: Icons.directions_transit, enabled: false),
          MenuItem(id: '6', label: 'subitem 6', icon: Icons.directions_run, enabled: true),
        ]);
        data.mainSubMenu.currentItem = data.mainSubMenu.items[0];
        break;
      case '3':
        //posts = await _api.getPostsForUser(userId);
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(id: '7', label: 'subitem 8', icon: Icons.accessibility, enabled: true),
          MenuItem(id: '9', label: 'subitem 9', icon: Icons.battery_alert, enabled: false),
          MenuItem(id: '10', label: 'subitem 10', icon: Icons.calendar_today, enabled: true),
        ]);
        data.mainSubMenu.currentItem = this
            .getMenuItemForId(items: this.data.mainSubMenu.items, id: this.data.mainSubMenuPath);
        break;

      default:
        data.mainSubMenu = MainSubMenu(items: []);
        data.mainSubMenu.currentItem = null;
    }
//    this.loadContainedItems(data);
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
//    this.loadContainedItems(data);
    setBusy(false);
  }

  void toggleSubMenuVisible() {
    setBusy(true);
    // whether to show or not
    this.data.mainSubMenuVisible = !this.data.mainSubMenuVisible;
    // whether to animate on next show
    this.data.mainSubMenuStartShowing = this.data.mainSubMenuVisible;
    this.data.statusText = this.data.mainSubMenuVisible ? 'Showing Menu' : 'Hiding Menu';
    setBusy(false);
  }

  void toggleShowOverlappedSubMenu(bool value) {
    setBusy(true);
    // whether to show or not
    this.data.showOverlappedSubMenu = !this.data.showOverlappedSubMenu;
    this.data.statusText =
        this.data.showOverlappedSubMenu ? 'Showing Overlapped Menu' : 'Showing Fixed Menu';

    setBusy(false);
  }

  void setStatusText(String value) {
    setBusy(true);
    // whether to show or not
    this.data.statusText = value;
    setBusy(false);
  }
}
