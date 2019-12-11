import 'package:json_annotation/json_annotation.dart';
import 'package:scrips_core/general/property_info.dart';

import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/data_models/organization.dart';

class OrganizationViewModel extends BaseModel {
  // BaseModel is mostly ChangeNotifier
  final Api _api = locator<Api>();

  List<Organization> organizations;

  Future fetchOrganizations() async {
    setViewModelState(ViewState.Busy);
    try {
      organizations =
          await _api.getOrganizations(query: ""); // TODO: this should be optional parameter with default null
    } catch (e) {
      organizations.clear();
      setViewModelState(ViewState.Err);
    }
    setViewModelState(ViewState.Idle);
  }

  Future<void> fetchOrganization(String orgID) async {
    assert(orgID != null);
  }

  Future<void> createOrganization(Organization organization) async {
    setViewModelState(ViewState.Busy);
    try {
      await _api.createOrganization(organization);
    } catch (e) {
      organizations.clear();
      setViewModelState(ViewState.Err);
    }
    setViewModelState(ViewState.Idle);

  }
}
