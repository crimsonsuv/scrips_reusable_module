import 'package:scrips_core/services/api/api.dart';
import 'package:scrips_core/viewmodels/base_model.dart';
import 'package:scrips_core/locator.dart';
import 'package:scrips_core/data_models/practice.dart';

class PracticeViewModel extends BaseModel {
  final Api _api = locator<Api>();

  Practice practice;

  void fetchPracticeDetails() {
    setState(ViewState.Busy);
    _api.getPractice();
    setState(ViewState.Idle);
  }
}
