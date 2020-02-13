import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password});
}
