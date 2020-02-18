import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_shared_features/features/sign_up/data/datasources/sign_up_data_source.dart';

class SignUpDummyDataSourceImpl extends SignUpDataSource {
  @override
  Future<User> getUser({String userName, String password}) async {
    await Future.delayed(Duration(seconds: 1));
    return User(
      userId: PropertyInfo(userName),
      //TODO remove PropertyInfo
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
}
