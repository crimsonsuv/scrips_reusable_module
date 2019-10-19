import 'package:flutter/cupertino.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_sub_menu.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:scrips_pm/constants/app_routes.dart';
import '../../datamodels/pratice_management/main_view.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class MainViewModel extends BaseModel {
  MainView data;
  final BuildContext context;
  //
  MainViewModel(this.context,
      {String mainMenuPath, String mainSubMenuPath, bool mainSubMenuVisible})
      : data = MainView(
            mainMenuPath: mainMenuPath,
            mainSubMenuPath: mainSubMenuPath,
            mainSubMenuVisible: mainSubMenuVisible),
        super();

  Future init({String userId}) async {
    this.loadMainMenuItems();
  }

  void loadMainMenuItems({String userId}) {
    //
    setBusy(true);
    //sumeet: note: this will call API.loadMenuItems for current userId
    this.data.mainMenu = MainMenu(items: [
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
    //
    this.loadSubMenuItems();
    //
    setBusy(false);
  }

  void loadSubMenuItems() {
    String mainMenuId = this.data?.mainMenu?.currentItem?.id;
    switch (mainMenuId) {
      case RoutePaths.Home:
        this.data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${RoutePaths.Home1}',
              label: 'Home - Home',
              icon: Icons.home,
              navigationRoute: '${RoutePaths.Home1}',
              enabled: true),
        ]);
        break;

      case RoutePaths.PracticeOnBoardingWizard:
        this.data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${RoutePaths.PracticeOnBoardingWizard1}',
              label: 'OnBoarding - 1',
              icon: Icons.directions_bike,
              navigationRoute: '${RoutePaths.PracticeOnBoardingWizard1}',
              enabled: true),
          MenuItem(
              id: '${RoutePaths.PracticeOnBoardingWizard2}',
              label: 'OnBoarding - 2',
              icon: Icons.directions_bike,
              navigationRoute: '${RoutePaths.PracticeOnBoardingWizard2}',
              enabled: true),
        ]);
        break;
      case RoutePaths.Settings:
        this.data.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${RoutePaths.Settings1}',
              label: 'Settings - 1',
              icon: Icons.directions_railway,
              navigationRoute: '${RoutePaths.Settings1}',
              enabled: true),
          MenuItem(
              id: '${RoutePaths.Settings2}',
              label: 'Settings - 2',
              icon: Icons.directions_railway,
              navigationRoute: '${RoutePaths.Settings2}',
              enabled: true),
        ]);
        break;

      default:
        this.data.mainSubMenu = MainSubMenu(items: []);
    }
    this.data.mainSubMenu.currentItem =
        this.getMenuItemForId(items: this.data?.mainSubMenu?.items, id: this.data?.mainSubMenuPath);
    debugPrint('Current Main Sub Menu Item: ${data?.mainSubMenu?.currentItem?.id}');
//    this.loadContainedItems(data);
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

  void setCurrentMainMenuItem(MenuItem item) {
    setBusy(true);
    this.data.mainMenu.currentItem = item;
    this.loadSubMenuItems();
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
