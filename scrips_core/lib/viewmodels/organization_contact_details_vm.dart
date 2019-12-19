import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrips_core/data_models/organisation_contact_details.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/viewmodels/general/global_model.dart';

import 'base_model.dart';

class OrganizationContactDetailsModel extends BaseModel {
  OrganizationContactDetails user = OrganizationContactDetails.defaults();
  final BuildContext context;
  GlobalModel globalModel;
//  Api _api;

  OrganizationContactDetailsModel(this.context)
      : /*this._api = Provider.of(context),*/
        this.globalModel = Provider.of<GlobalModel>(context, listen: false),

        super();

  // scrips: sumeet: we keep all menu items for the user in globalmodeland clone them here so they are loaded only once on user login
  bool init() {
    return true;
  }
}

////
