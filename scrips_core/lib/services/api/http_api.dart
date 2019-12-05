import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/menu/main_menu.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/data_models/practice.dart';

import 'api.dart';

/// The service responsible for networking requests
class HttpApi implements Api {
  static const endpoint = 'https://jsonplaceholder.typicode.com';

  var client = new http.Client();

  @override
  Future<User> getUser(BuildContext context, {String userName, String password}) async {
    // Get user profile for id
    var response = await client.get('$endpoint/users/$userName');

    // Convert and return
    return User.fromJson(json.decode(response.body));
  }

  @override
  Future<MainMenu> getMenuItems(String userId) {
    // TODO: implement getMenuItems
    return null;
  }

  @override
  Future<LoginResponse> login(BuildContext context, {String userName, String password}) {
    // TODO: implement login
    return null;
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
}
