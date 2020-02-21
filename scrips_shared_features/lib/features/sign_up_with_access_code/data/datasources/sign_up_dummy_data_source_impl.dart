import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datasources/sign_up_data_source.dart';

class SignUpDummyDataSourceImpl extends SignUpDataSource {
  @override
  Future<SignupByCodeResponse> signUpByCode({String email, String code}) {
    // TODO: implement signUpByCode
    return null;
  }
}
