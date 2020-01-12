import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datasources/login_data_source.dart';

class LoginDummyDataSourceImpl extends LoginDataSource {
  static final endpoint = 'lib/core/mock_jsons/';

  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 2));
    var response;
    if (userName == "admin@scrips.com") {
      response =
          await rootBundle.loadString(endpoint + "admin_login_data.json");
    } else {
      response = await rootBundle.loadString(endpoint + "user_login_data.json");
      print(response);
    }

    if (response != null) {
      return loginResponseFromJson(response);
    } else {
      return null;
    }
  }
}
