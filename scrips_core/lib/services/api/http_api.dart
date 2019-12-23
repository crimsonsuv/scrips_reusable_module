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
import 'package:scrips_core/utils/utils.dart';

import '../../data_models/organisation_contact_details.dart';
import 'api.dart';

/// The service responsible for networking requests
class HttpApi implements Api {
  int _defaultTimeout = 120;
  static final endpoint =
      'http://scripsorganizationapi20191204032750.azurewebsites.net';
  int _timeout = 30;
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

  Future myWait_defaultTimeoutsecondsFuture() async {
    await Future.delayed(Duration(seconds: _defaultTimeout));
  }

  Future<List<Organization>> getOrganizations({String query}) async {
    var organizations = List<Organization>();

    var response = await client.get('$endpoint/Organization?query=$query',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Something happened! Please retry in a few seconds.');
    });

    // Parse into List
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> parsed = map["organizations"];

    // Loop and convert each item to a Organization
    for (var org in parsed) {
      //sumeet: note: ensure contactDetails element is present
      org['contactDetails'] = org['contactDetails'] ?? Map<String, dynamic>();
      organizations.add(Organization.fromJson(org));
    }

    return organizations;
  }

  @override
  Future<List<ValueDisplayPair>> getOrganizationTypes() async {
    var response = await client.get(
        '$endpoint/api/ValueSets?valueSetNames=OrganizationType',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Cannot fetch Organization Types');
    });

    // Parse into List (TODO: make it more generic - this is ugly)
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> valueSets = map["valueSets"] ?? [];
    if(valueSets.length > 0){
      Map<String, dynamic> infoEntries = valueSets.first;
      List<dynamic> entries = infoEntries['entries'];
      List<ValueDisplayPair> data = List<ValueDisplayPair>();
      for (var entry in entries) {
        data.add(ValueDisplayPair(entry['code'], entry['display']));
      }
      return data;
    } else {
      return [];
    }
  }

  @override
  Future<List<ValueDisplayPair>> getOrganizationCountries() async {
    var response = await client.get(
        '$endpoint/api/ValueSets?valueSetNames=OrganizationCountries',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Cannot fetch Organization Countries');
    });
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> valueSets = map["valueSets"] ?? [];
    if(valueSets.length > 0){
      Map<String, dynamic> infoEntries = valueSets.first;
      List<dynamic> entries = infoEntries['entries'];
      List<ValueDisplayPair> data = List<ValueDisplayPair>();
      for (var entry in entries) {
        data.add(ValueDisplayPair(entry['code'], entry['display']));
      }
      return data;
    } else {
      return [];
    }
  }

  @override
  Future<List<ValueDisplayPair>> getOrganizationLicense() async {
    var response = await client.get(
        '$endpoint/api/ValueSets?valueSetNames=OrganizationLicense',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: _defaultTimeout), onTimeout: () {
      throw Exception('Cannot fetch Organization Types');
    });

    // Parse into List (TODO: make it more generic - this is ugly)
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> valueSets = map["valueSets"] ?? [];
    if(valueSets.length > 0){
      Map<String, dynamic> infoEntries = valueSets.first;
      List<dynamic> entries = infoEntries['entries'];
      List<ValueDisplayPair> data = List<ValueDisplayPair>();
      for (var entry in entries) {
        data.add(ValueDisplayPair(entry['code'], entry['display']));
      }
      return data;
    } else {
      return [];
    }
  }

  @override
  Future<Organization> getOrganization({String organizationID}) async {
    var response = await client.get('$endpoint/Organization/$organizationID',
        headers: {
          'accept': 'text/json'
        }).timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot fetch Organization $organizationID');
    });
    var parsed = json.decode(response.body);
    if (parsed['contactDetails'] == null ||
        !(parsed['contactDetails'] is Map)) {
      parsed['contactDetails'] = Map<String, dynamic>();
    }
    Organization org = Organization.fromJson(parsed);
    return org;
  }

  @override
  Future<void> createOrganization(Organization organization) async {
    var body = json.encode(organization.toJson());
    var response = await client
        .post('$endpoint/Organization',
            headers: {
              'accept': 'text/plain',
              'Content-Type': 'application/json'
            },
            body: body)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot create Organization');
    });
//    print(response);
  }

  @override
  Future<void> createContactDetails(ContactDetails contactDetails,
      {String organizationID}) async {
    var body = json.encode(contactDetails.toJson());
    var response = await client
        .post('$endpoint/Organization/ContactDetails/$organizationID',
            headers: {
              'accept': 'text/plain',
              'Content-Type': 'application/json'
            },
            body: body)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot create Contact Details');
    });
    print(response);
  }

  @override
  Future<void> updateOrganization(Organization organization) async {
    var body = json.encode(organization.toJson());
    var response = await client
        .put('$endpoint/Organization/${organization?.organizationId}',
            headers: {
              'accept': 'text/plain',
              'Content-Type': 'application/json'
            },
            body: body)
        .timeout(Duration(seconds: _timeout), onTimeout: () {
      throw Exception('Cannot create Organization');
    });
//    print(response);
  }
}
