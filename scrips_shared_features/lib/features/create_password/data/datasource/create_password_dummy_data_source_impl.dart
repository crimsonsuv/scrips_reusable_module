import 'package:scrips_core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';

class CreatePasswordDummyDataSourceImpl extends CreatePasswordDataSource {
  @override
  Future<Success> setPassword(
      {String email, String password, String passwordResetToken}) {
    // TODO: implement signUpByCode
    return null;
  }

  @override
  Future<SignUpUserData> signupUserData({String email}) {
    // TODO: implement signupUserData
    return null;
  }
}
