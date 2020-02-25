import 'package:scrips_shared_features/features/login/data/datamodels/user_data_model.dart';

abstract class LandingDataSource {
  Future<User> getLoggedUser();
}
