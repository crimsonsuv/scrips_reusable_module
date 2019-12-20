import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/organisation_contact_details.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:flutter/material.dart';

class ContactDetailsModel extends BaseModel {
  ContactDetails contactDetails;

  final Api _api = locator<Api>();

  final BuildContext context;
  //GlobalModel globalModel;
//  Api _api;

  ContactDetailsModel(this.context)
      : /*this._api = Provider.of(context),*/
        //this.globalModel = Provider.of<GlobalModel>(context, listen: false),

        super();

  // scrips: sumeet: we keep all menu items for the user in globalmodeland clone them here so they are loaded only once on user login


  bool init() {
    return true;
  }
}

////
