import 'package:flutter/cupertino.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    return null;
    // TODO: implement login
  }
}
