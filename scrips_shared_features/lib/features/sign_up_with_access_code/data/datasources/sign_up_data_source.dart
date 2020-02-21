import 'package:scrips_shared_features/features/sign_up_with_access_code/data/datamodels/signup_by_code_response_model.dart';

abstract class SignUpDataSource {
  Future<SignupByCodeResponse> signUpByCode({String email, String code});
}
