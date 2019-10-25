import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/mock_data/mock_data_menu_items.dart';

import 'api.dart';

class FakeApi implements Api {
  @override
  Future<User> getUser(BuildContext context, {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return User(userId: userName, fullName: 'user $userName', phoneNumber: '');
  }

  @override
  Future<LoginResponse> login(BuildContext context, {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));

    return LoginResponse(user: User(userId: userName, fullName: userName));
  }

  @override
  Future<MainMenu> getMenuItems(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> json = mockDataMenuItems;
    MainMenu mainMenu = MainMenu.fromJson(json);
    return mainMenu;
  }
}
