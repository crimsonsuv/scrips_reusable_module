import 'package:scrips_shared_features/core/constants/status_objects.dart';
import 'package:scrips_shared_features/features/create_password/data/datasource/create_password_data_source.dart';

class CreatePasswordDummyDataSourceImpl extends CreatePasswordDataSource {
  @override
  Future<Success> setPassword(
      {String email, String password, String passwordResetToken}) {
    // TODO: implement signUpByCode
    return null;
  }
}
