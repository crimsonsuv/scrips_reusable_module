import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDummyDataSourceImpl extends LoginDataSource {
  @override
  Future<LoginTokens> oauth2Login() async {
    return null;
  }


}
