import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/data_models/organization.dart';

class OrganizationViewModel extends BaseModel { // BaseModel is mostly ChangeNotifier
  final Api _api = locator<Api>();

  List<Organization> organizations;

  Future fetchOrganizations() async {
    setBusy(true);
    organizations = await _api.getOrganizations(query: "");
    setBusy(false);
  }
}
