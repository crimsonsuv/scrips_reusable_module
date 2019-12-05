import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/menu/main_menu.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/datamodels/pratice_management/practice_details.dart';

abstract class Api {
  Future<User> getUser(BuildContext context, {String userName, String password});
  Future<MainMenu> getMenuItems(String userId);

  Future<LoginResponse> login(BuildContext context, {String userName, String password});

  // Practice API
  Future<List<PracticeDetailsModel>> getPractices(/*TODO*/);
  Future<List<PracticeDetailsModel>> getPractice(/*TODO*/);
  Future<PracticeDetailsModel> addPractice(/*TODO*/);


}
