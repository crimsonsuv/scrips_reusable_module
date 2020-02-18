import 'package:scrips_core/data_models/user/user.dart';

abstract class SignUpDataSource {
  Future<User> getUser({String userName, String password});
}
