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
      organizations = await _api.getOrganizations(
          query: ""); // This should be optional parameter with default null
      // } on Exception catch (e) {
      //   print('Unknown exception $e');
    } catch (e) {
      setViewModelState(ViewState.Err, error: e);
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
