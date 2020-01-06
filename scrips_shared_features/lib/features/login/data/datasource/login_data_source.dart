import 'package:flutter/cupertino.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';

abstract class LoginDataSource {
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password});

  Future<MainMenu> getMenuItems(String userId);
}
