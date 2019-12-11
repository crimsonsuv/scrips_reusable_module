import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/data_models/practice.dart';
import 'package:scrips_core/data_models/organization.dart';

abstract class Api {
  static const endpoint = 'https://scripsorganizationapi20191204032750.azurewebsites.net';

  Future<User> getUser(BuildContext context, {String userName, String password});
  Future<MainMenu> getMenuItems(String userId);
  Future<LoginResponse> login(BuildContext context, {String userName, String password});

  // Practice API
  Future<List<Practice>> getPractices(/*TODO*/);
  Future<List<Practice>> getPractice(/*TODO*/);
  Future<Practice> addPractice(/*TODO*/);

//  Organization API
  Future<List<Organization>> getOrganizations({String query});
  Future<Organization> getOrganization({String organizationID});
  Future<void> createOrganization(Organization organization);
}
