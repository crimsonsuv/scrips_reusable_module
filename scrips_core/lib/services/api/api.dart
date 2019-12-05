import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/data_models/practice.dart';

abstract class Api {
  Future<User> getUser(BuildContext context, {String userName, String password});
  Future<MainMenu> getMenuItems(String userId);

  Future<LoginResponse> login(BuildContext context, {String userName, String password});

  // Practice API
  Future<List<Practice>> getPractices(/*TODO*/);
  Future<List<Practice>> getPractice(/*TODO*/);
  Future<Practice> addPractice(/*TODO*/);


}
