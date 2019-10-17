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
      MenuItem(
          id: RoutePaths.Home,
          label: 'Home',
          icon: Icons.home,
          navigationRoute: RoutePaths.Home,
          enabled: true),
      MenuItem(
          id: RoutePaths.PracticeOnBoardingWizard,
          label: 'Onboard Pratice',
          icon: Icons.stars,
          navigationRoute: RoutePaths.PracticeOnBoardingWizard,
          enabled: true),
      MenuItem(
          id: RoutePaths.Settings,
          label: 'Settings',
          icon: Icons.settings,
          navigationRoute: RoutePaths.Settings,
          enabled: true),
    ]);
    //
    data.mainMenu.currentItem =
        this.getMenuItemForId(items: this.data?.mainMenu?.items, id: this.data?.mainMenuPath);
    debugPrint('Current Main Menu Item: ${data?.mainMenu?.currentItem?.id}');
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
      case RoutePaths.Home:
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.Home}',
              label: 'Home - Home',
              icon: Icons.directions_boat,
              navigationRoute: '${mainMenuId}-${RoutePaths.Home}',
              enabled: true),
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.Home}',
              label: 'Home 2',
              icon: Icons.directions_bus,
              navigationRoute: '${mainMenuId}-${RoutePaths.Home}-2',
              enabled: false),
        ]);
        break;

      case RoutePaths.PracticeOnBoardingWizard:
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.PracticeOnBoardingWizard}',
              label: 'OnBoarding - 1',
              icon: Icons.directions_bike,
              navigationRoute: '${mainMenuId}-${RoutePaths.PracticeOnBoardingWizard}',
              enabled: true),
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.PracticeOnBoardingWizard}-2',
              label: 'OnBoarding - 2',
              icon: Icons.directions_run,
              navigationRoute: '${mainMenuId}-${RoutePaths.PracticeOnBoardingWizard}-2',
              enabled: true),
        ]);
        break;
      case RoutePaths.Settings:
        data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.Settings}-1',
              label: 'Settings - 1',
              icon: Icons.directions_railway,
              navigationRoute: '${mainMenuId}-${RoutePaths.Settings}',
              enabled: true),
          MenuItem(
              id: '${mainMenuId}-${RoutePaths.Settings}-2',
              label: 'Settings - 2',
              icon: Icons.directions_subway,
              navigationRoute: '${mainMenuId}-${RoutePaths.Settings}-2',
              enabled: true),
        ]);
        break;

      default:
        data.mainSubMenu = MainSubMenu(items: []);
    }
    data.mainSubMenu.currentItem =
        this.getMenuItemForId(items: this.data?.mainSubMenu?.items, id: this.data?.mainSubMenuPath);
    debugPrint('Current Main Sub Menu Item: ${data?.mainSubMenu?.currentItem?.id}');
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
