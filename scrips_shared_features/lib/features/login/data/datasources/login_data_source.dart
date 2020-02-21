
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';

abstract class LoginDataSource {
  Future<LoginTokens> oauth2Login();
}
