import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';

abstract class LoginDataSource {
  Future<LoginUserData> oauth2Login();
  Future<LoginUserData> login({String userName, String password});
}
