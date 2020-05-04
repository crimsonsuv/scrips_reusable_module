import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDummyDataSourceImpl extends LoginDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<LoginUserData> oauth2Login() async {
    return null;
  }

  @override
  Future<LoginUserData> login(
      {String userName, String password}) async {
    return null;
  }
}
