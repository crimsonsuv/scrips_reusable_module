import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';

class PracticeDetailsModel extends BaseModel {
  final Api _api = locator<Api>();

  String practiceName;
  String licenseNumber;
  String licenseIssuingAuthority;
  DateTime licenseExpirationDate;
  String billingTaxID;
  String practiceDescription;
  bool isPrimary;

  void fetchPracticeDetails() {
    setBusy(true);
    _api.getPractice();
    setBusy(false);
  }
}
