import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/data_models/organization.dart';
import 'package:flutter/material.dart';

class OrganizationViewModel extends BaseModel {
  // BaseModel is mostly ChangeNotifier
  final Api _api = locator<Api>();
  final BuildContext context;
  List<Organization> organizations;
  Organization organization;
  // TODO: List<String> should become List<OrganizationTypes>
  List<String> organizationTypes = List<String>();

  OrganizationViewModel(this.context)
      : /*this._api = Provider.of(context),*/
        super();

  Future fetchOrganizations() async {
    setViewModelState(ViewState.Busy);
    try {
      organizations = await _api.getOrganizations(query: ""); // This should be optional parameter with default null
      // } on Exception catch (e) {
      //   print('Unknown exception $e');
    } on Exception catch (e) {
      setViewModelState(ViewState.Err, exception: e);
    }
    setViewModelState(ViewState.Idle);
  }

  Future<void> fetchOrganization(String orgID) async {
    assert(orgID != null);
  }

  Future<bool> createOrganization() async {
    setViewModelState(ViewState.Busy);
    try {
      await _api.createOrganization(this.organization);
    } catch (e) {
      setViewModelState(ViewState.Err);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  Future<void> fetchOrganizationTypes() async {
    setViewModelState(ViewState.Busy);
    try {
      organizationTypes = await _api.getOrganizationTypes();
    } on Exception catch (e) {
      organizationTypes.clear();
    }
    setViewModelState(ViewState.Idle);
  }

  Future<bool> updateOrganization() async{
    setViewModelState(ViewState.Busy);
    try {
      await _api.updateOrganization(this.organization);
    } catch (e) {
      setViewModelState(ViewState.Err);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }


  init() {}
}
