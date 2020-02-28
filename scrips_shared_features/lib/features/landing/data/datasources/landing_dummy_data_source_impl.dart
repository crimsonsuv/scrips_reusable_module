import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

import 'landing_data_source.dart';

class LandingDummyDataSourceImpl extends LandingDataSource {
  @override
  Future<LoginUserData> getLoggedUser() async {
    return null;
  }
}
