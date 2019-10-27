import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:scrips_core/datamodels/login/login.dart';
import 'package:scrips_core/datamodels/user/user.dart';

import 'api.dart';

class AuthenticationService {
  final Api _api;

  AuthenticationService({Api api}) : _api = api;

  Future<LoginResponse> login(BuildContext context, {String userName, String password}) async {
    User fetchedUser = await _api.getUser(context, userName: userName, password: password);
    //
    var hasUser = fetchedUser?.userId?.value != '';
    if (hasUser) {
      // todo: localize
      return LoginResponse(success: true, user: fetchedUser, message: 'Logged in');
    } else {
      return LoginResponse(success: false, user: null, message: 'Failed to Log in Yser');
    }
  }
}
