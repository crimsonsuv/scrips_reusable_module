import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/menu/main_menu_item.dart';
import 'package:scrips_core/datamodels/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/general/global_model.dart';
import '../../datamodels/pratice_management/pm_main_view.dart';
import '../../widgets/general/text_view_and_label.dart';
import '../base_model.dart';

class PmMainViewModel extends BaseModel {
  PmMainView data;
  final BuildContext context;
  GlobalModel globalModel;
  Api _api;

  PmMainViewModel(this.context, {String mainMenuPath, String mainSubMenuPath, bool mainSubMenuVisible})
      : data =
            PmMainView(mainMenuPath: mainMenuPath, mainSubMenuPath: mainSubMenuPath, mainSubMenuVisible: mainSubMenuVisible),
        this._api = Provider.of(context),
        this.globalModel = Provider.of<GlobalModel>(context, listen: false),
        super();

  // scrips: sumeet: we keep all menu items for the user in globalmodeland clone them here so they are loaded only once on user login
  bool init() {
    debugPrint('SCRIPSLOG pmMainModel.dart::init Called');
    // clone main me u from global
    this.data.mainMenu = MainMenu.fromJson(this.globalModel.data.mainMenu.toJson());
    this.selectMenuItem(mainMenuPath: this.data.mainMenuPath, mainSubMenuPath: this.data.mainSubMenuPath);
    return true;
  }

  void selectMenuItem({String mainMenuPath, String mainSubMenuPath}) {
    debugPrint('SCRIPSLOG globalmodel.dart::selectMenuItem Called');
    this.data.mainMenu.currentItem = this.getMenuItemForId(items: this.data?.mainMenu?.items, id: mainMenuPath);
    this.data.mainMenu.currentItem.subMenu.currentItem =
        this.getMenuItemForId(items: data.mainMenu?.currentItem?.subMenu?.items, id: mainSubMenuPath);
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

  void toggleSubMenuVisible() {
    debugPrint('SCRIPSLOG pmMainModel.dart::toggleSubMenuVisible Called');
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
