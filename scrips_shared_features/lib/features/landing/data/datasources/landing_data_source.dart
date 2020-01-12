import 'package:scrips_core/data_models/user/user.dart';

abstract class LandingDataSource {
  Future<User> getLoggedUser();
}
