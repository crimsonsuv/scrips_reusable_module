import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_shared_features/features/login/data/datasource/login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    // TODO: implement login
  }

  @override
  Future<MainMenu> getMenuItems(String userId) {
    // TODO: implement getMenuItems
    return null;
  }
}
