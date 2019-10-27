import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/datamodels/user/user.dart';
//import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/general/global_model.dart';

import '../base_model.dart';

class UserModel extends BaseModel {
  User data = User();
  final BuildContext context;
  GlobalModel globalModel;
//  Api _api;

  UserModel(this.context)
      : /*this._api = Provider.of(context),*/
        this.globalModel = Provider.of<GlobalModel>(context, listen: false),
        this.data = Provider.of<GlobalModel>(context, listen: false).data.user,
        super();

  // scrips: sumeet: we keep all menu items for the user in globalmodeland clone them here so they are loaded only once on user login
  bool init() {
    return true;
  }


}

////