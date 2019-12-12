import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/data_models/practice.dart';
import 'package:scrips_core/data_models/organization.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_core/mock_data/mock_data_menu_items.dart';

import 'api.dart';

/// The service responsible for networking requests
class HttpApi implements Api {
  static const endpoint =
      'https://scripsorganizationapi20191204032750.azurewebsites.net';

  var client = http.Client();

  @override
  Future<User> getUser(BuildContext context,
      {String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return User(
      userId: PropertyInfo(userName),
      userName: PropertyInfo(userName),
      fullName: PropertyInfo('user $userName'),
      phoneNumber:
          PropertyInfo('$userName-$userName$userName-$userName-$userName'),
      gender: PropertyInfo('M'),
      lastLoggedIn: PropertyInfo(null),
      accessToken: PropertyInfo('xyashgdcfbdb'),
      email: PropertyInfo('2@a.com'),
      password: PropertyInfo(password),
    );
  }

  @override
  Future<MainMenu> getMenuItems(String userId) async {
    // TODO: implement getMenuItems from endpoint
    await Future.delayed(Duration(seconds: 1));
    Map<String, dynamic> json = mockDataMenuItems;
    MainMenu mainMenu = MainMenu.fromJson(json);
    return mainMenu;
//    return null;
  }

  @override
  Future<LoginResponse> login(BuildContext context,
      {String userName, String password}) async {
    // TODO: implement login
    await Future.delayed(Duration(seconds: 1));

    return LoginResponse(
      user: User(
        userId: PropertyInfo(userName),
        userName: PropertyInfo(userName),
        fullName: PropertyInfo('user $userName'),
        phoneNumber:
            PropertyInfo('$userName-$userName$userName-$userName-$userName'),
        gender: PropertyInfo('M'),
        lastLoggedIn: PropertyInfo(null),
        accessToken: PropertyInfo('xyashgdcfbdb'),
        email: PropertyInfo('2@a.com'),
        password: PropertyInfo(password),
      ),
    );
  }

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
  // Organization
  //

  Future myWait10secondsFuture() async {
    await Future.delayed(Duration(seconds: 10));
  }

  Future<List<Organization>> getOrganizations({String query}) async {
    var organizations = List<Organization>();

    var response = await client.get('$endpoint/Organization?Query=$query',
        headers: {'accept': 'text/json'});
    //     }).timeout(Duration(seconds: 10), onTimeout: () {
    //   throw Exception('Something happened! Please retry in a few seconds.');
    // });

//    var response = await myWait10secondsFuture().timeout(Duration(seconds: 3), onTimeout: () {
//      throw Exception('Timeout');
//    });
//    return Future<Null>(null);

    // Parse into List
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> parsed = map["organizations"];

    // Loop and convert each item to a Organization
    for (var org in parsed) {
      organizations.add(Organization.fromJson(org));
    }

    return organizations;
  }

  Future<Organization> getOrganization({String organizationID}) async {
    var response = await client.get('$endpoint/Organization/$organizationID',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: 10), onTimeout: () {
      throw Exception('Cannot fetch Organization $organizationID');
    });

    var parsed = json.decode(response.body);
    Organization org = Organization.fromJson(parsed);
    return org;
  }

  Future<void> createOrganization(Organization organization) async {
    var body = json.encode(organization.toJson());
    var response = await client
        .post('$endpoint/Organization',
            headers: {
              'accept': 'text/plain',
              'Content-Type': 'application/json'
            },
            body: body)
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw Exception('Cannot create Organization');
    });
    print(response);
  }
}
