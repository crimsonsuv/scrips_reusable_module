import 'package:flutter/material.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/mock_data/mock_data_menu_items.dart';
import 'package:scrips_core/data_models/practice.dart';
import 'package:scrips_core/data_models/organization.dart';

import 'api.dart';

class FakeApi implements Api {
  @override
  Future<User> getUser(BuildContext context, {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return User(
      userId: PropertyInfo(userName),
      userName: PropertyInfo(userName),
      fullName: PropertyInfo('user $userName'),
      phoneNumber: PropertyInfo('$userName-$userName$userName-$userName-$userName'),
      gender: PropertyInfo('M'),
      lastLoggedIn: PropertyInfo(null),
      accessToken: PropertyInfo('xyashgdcfbdb'),
      email: PropertyInfo('2@a.com'),
      password: PropertyInfo(password),
    );
  }

  @override
  Future<LoginResponse> login(BuildContext context, {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));

    return LoginResponse(
      user: User(
        userId: PropertyInfo(userName),
        userName: PropertyInfo(userName),
        fullName: PropertyInfo('user $userName'),
        phoneNumber: PropertyInfo('$userName-$userName$userName-$userName-$userName'),
        gender: PropertyInfo('M'),
        lastLoggedIn: PropertyInfo(null),
        accessToken: PropertyInfo('xyashgdcfbdb'),
        email: PropertyInfo('2@a.com'),
        password: PropertyInfo(password),
      ),
    );
  }

  @override
  Future<MainMenu> getMenuItems(String userId) async {
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> json = mockDataMenuItems;
    MainMenu mainMenu = MainMenu.fromJson(json);
    return mainMenu;
  }

  //
  // Practice
  //
  @override
  Future<List<Practice>> getPractices(/*TODO*/) {
    return null;
  }

  Future<List<Practice>> getPractice(/*TODO*/) {
    return null;
  }

  Future<Practice> addPractice(/*TODO*/) {
    return null;
  }

  //
  // Organizations
  //
  Future<List<Organization>> getOrganizations({String query}) {
    var organizations = List<Organization>();
    List<dynamic> orgs = mockDataOrganizations["organizations"];

    for (var org in orgs) {
      organizations.add(Organization.fromJson(org));
    }
    return Future<List<Organization>>.value(organizations);
  }

  Future<Organization> getOrganization({String organizationID}) async {
    return Organization.fromJson(mockDataOrganizations["organizations"][0]); // return first element of the mock list
  }

  Future<void> createOrganization(Organization organization) async {}

  Future<List<String>> getOrganizationTypes() async {
    return null;
  }

  @override
  Future<void> updateOrganization(Organization organization) {
    // TODO: implement updateOrganization
    throw UnimplementedError();
  }
}
