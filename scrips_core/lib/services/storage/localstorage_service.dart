import 'dart:async';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:scrips_core/datamodels/user/user.dart';
import 'package:scrips_core/services/storage/storage_service.dart';

class LocalStorageService implements StorageService {
  final LocalStorage _scripsStorage = new LocalStorage('scripsStorage');
//  final StreamController<int> _postUpdated = StreamController<int>.broadcast();

  final _loggedInUserKey = 'logged-in-user';

//  @override
//  Stream<int> get postUpdateStream => _postUpdated.stream;
////
  @override
  Future<User> getLoggedInUser() async {
    debugPrint('SCRIPSLOG StorageService.dart::getLoggedInUser called'); // Get all the current posts
    User user;
    Map<String, dynamic> data = _scripsStorage.getItem(_loggedInUserKey);
    try {
      // check if the one we're liking is in the collection
      if (data != null) {
        // convert to a post
        user = User.fromJson(data);
        return user;
      } else {
        user = User();
      }
    } catch (ex) {
      debugPrint('SCRIPSLOG StorageService.dart::getLoggedInUser exception ${ex?.toString()}');
      user = User();
    } finally {
      debugPrint('SCRIPSLOG StorageService.dart::getLoggedInUser returning userId: ${user?.userId?.value}');
    }
    return user;
  }

  @override
  Future<bool> setLoggedInUser(User user) async {
    try {
      // check if the one we're liking is in the collection
      if (user == null) {
        user = User();
      }
      // convert to a user json
      Map<String, dynamic> data = user.toJson();

      // save all the data back to the local storage
      await _scripsStorage.setItem(_loggedInUserKey, data);
      //
      return true;
    } catch (ex) {
      return false;
    }
  }

  @override
  void dispose() {
//    _postUpdated.close();
  }

  @override
  Future<bool> ready() async {
    if (_scripsStorage != null) {
      return await _scripsStorage.ready;
    } else {
      return new Future<bool>(() async {
        return false;
      });
    }
  }
}
