import 'package:scrips_core/data_models/organisation_contact_details.dart';
import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/utils/utils.dart';
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
  List<ValueDisplayPair> organizationTypes = [];

  OrganizationViewModel(this.context)
      : /*this._api = Provider.of(context),*/
        super();


  Future<bool> fetchOrganizations() async {
    setViewModelState(ViewState.Busy);
    try {
      organizations = await _api.getOrganizations(
          query: ""); // This should be optional parameter with default null
      // } on Exception catch (e) {
      //   print('Unknown exception $e');
    } on Exception catch (e) {
      debugLog('ERROR: fetchOrganizations ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  Future<bool> createContactDetails(String orgID) async {
    setViewModelState(ViewState.Busy);
    try {
      await _api.createContactDetails(this.organization.contactDetails, organizationID: orgID);
    } catch (e) {
      debugLog('ERROR: create Contact Details ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  Future<void> fetchOrganization(String orgID) async {
    setViewModelState(ViewState.Busy);
    try {
      organization = await _api.getOrganization(
          organizationID:
              orgID); // This should be optional parameter with default null
      // } on Exception catch (e) {
      //   print('Unknown exception $e');
      print(organization.toJson());
    } on Exception catch (e) {
      debugLog('ERROR: fetchOrganization ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  Future<bool> createOrganization() async {
    setViewModelState(ViewState.Busy);
    try {
      await _api.createOrganization(this.organization);
      await this.fetchOrganizations();
    } catch (e) {
      debugLog('ERROR: createOrganization ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  Future<void> fetchOrganizationTypes() async {
    setViewModelState(ViewState.Busy);
    try {
      // just used hardcoded types for now
      return [];
//      organizationTypes = await _api.getOrganizationTypes();
    } on Exception catch (e) {
      debugLog('ERROR: fetchOrganizationTypes ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
  }

  Future<bool> updateOrganization() async {
    setViewModelState(ViewState.Busy);
    try {
      await _api.updateOrganization(this.organization);
      await this.fetchOrganizations();
    } catch (e) {
      debugLog('ERROR: updateOrganization ${e.toString()}');
      setViewModelState(ViewState.Err, exception: e);
      return false;
    }
    setViewModelState(ViewState.Idle);
    return true;
  }

  init() {
    //sumeet: ensure org is created
    organization = Organization(contactDetails: ContactDetails());
    organizations = [];
  }
}
