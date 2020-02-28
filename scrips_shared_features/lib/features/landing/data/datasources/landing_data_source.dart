import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

abstract class LandingDataSource {
  Future<LoginUserData> getLoggedUser();
}
