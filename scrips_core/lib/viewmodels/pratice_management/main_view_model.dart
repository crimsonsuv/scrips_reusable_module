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
  MainView mainFrameData;
  final BuildContext context;
  //
  MainViewModel(this.context, {String mainMenuPath, String mainSubMenuPath})
      : mainFrameData = MainView(mainMenuPath: mainMenuPath, mainSubMenuPath: mainSubMenuPath),
        super();

  Future init({String userId}) async {
    this.loadMainMenuItems();
  }

  void loadMainMenuItems({String userId}) {
    //
    setBusy(true);
    //sumeet: note: this will call API.loadMenuItems for current userId
    this.mainFrameData.mainMenu = MainMenu(items: [
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
    mainFrameData.mainMenu.currentItem = this.getMenuItemForId(
        items: this.mainFrameData?.mainMenu?.items, id: this.mainFrameData?.mainMenuPath);
    debugPrint('Current Main Menu Item: ${mainFrameData?.mainMenu?.currentItem?.id}');
    //
    this.loadSubMenuItems();
    //
    setBusy(false);
  }

  void loadSubMenuItems() {
    String mainMenuId = this.mainFrameData?.mainMenu?.currentItem?.id;
    switch (mainMenuId) {
      case RoutePaths.Home:
        this.mainFrameData.mainSubMenu = MainSubMenu(items: [
          MenuItem(
              id: '${RoutePaths.Home1}',
              label: 'Home - Home',
              icon: Icons.home,
              navigationRoute: '${RoutePaths.Home1}',
              enabled: true),
        ]);
        break;

      case RoutePaths.PracticeOnBoardingWizard:
        this.mainFrameData.mainSubMenu = MainSubMenu(items: [
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
        this.mainFrameData.mainSubMenu = MainSubMenu(items: [
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
        this.mainFrameData.mainSubMenu = MainSubMenu(items: []);
    }
    this.mainFrameData.mainSubMenu.currentItem = this.getMenuItemForId(
        items: this.mainFrameData?.mainSubMenu?.items, id: this.mainFrameData?.mainSubMenuPath);
    debugPrint('Current Main Sub Menu Item: ${mainFrameData?.mainSubMenu?.currentItem?.id}');
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
    this.mainFrameData.mainMenu.currentItem = item;
    this.loadSubMenuItems();
    this.mainFrameData.mainSubMenuVisible = true;
    setBusy(false);
  }

  void setCurrentMainSubMenuItem(MenuItem item, bool hideOnSelect) {
    setBusy(true);
    this.mainFrameData.mainSubMenu.currentItem = item;
    if (hideOnSelect) {
      this.mainFrameData.mainSubMenuVisible = false;
    }
//    this.loadContainedItems(data);
    setBusy(false);
  }

  void toggleSubMenuVisible() {
    setBusy(true);
    // whether to show or not
    this.mainFrameData.mainSubMenuVisible = !this.mainFrameData.mainSubMenuVisible;
    // whether to animate on next show
    this.mainFrameData.mainSubMenuStartShowing = this.mainFrameData.mainSubMenuVisible;
    this.mainFrameData.statusText =
        this.mainFrameData.mainSubMenuVisible ? 'Showing Menu' : 'Hiding Menu';
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
