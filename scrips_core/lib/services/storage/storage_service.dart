import 'package:scrips_core/datamodels/user/user.dart';

abstract class StorageService {
//  Stream<int> get postUpdateStream;
  Future<bool> ready();

  Future<bool> setLoggedInUser(User user);
  Future<User> getLoggedInUser();

  void dispose();
}
