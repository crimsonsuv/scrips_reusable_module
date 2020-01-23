import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/forgot_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_by_code_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/reset_password_model.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/set_password_model.dart';
import 'package:scrips_shared_features/features/login/domain/repository/login_repository.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/get_login_response_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginResponseUseCase getLoginResponseUseCase;
  final LoginRepository getLoginRepository;

  LoginBloc({
    @required GetLoginResponseUseCase loginResponseUseCase,
    @required LoginRepository loginRepository,
  })  : assert(loginResponseUseCase != null),
        assert(loginRepository != null),
        getLoginRepository = loginRepository,
        getLoginResponseUseCase = loginResponseUseCase;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SetLoginDummyDataEvent) {
      final result1 = await getLoginRepository.getForgotPasswordResponse(ForgotPasswordModel(email: 'user@example.com'));
      final result2 = await getLoginRepository.getLoginByCodeResponse(LoginByCode(email: 'user@example.com',code: "string"));
      print('forgot password ${result1}');
      print('login by code  ${result2}');
      String dummyUserName = "user@scrips.com";
      String dummyUserPassword = "123456";
      User user = User(email: dummyUserName, password: dummyUserPassword);
      yield LoginDummyDataState(user);
      yield EnableLoginButtonState(user, true);
    } else if (event is DoLoginEvent) {
      yield LoginBeginLoading();
      final result = await getLoginResponseUseCase(
        Params(
          context: event.context,
          email: event.user.email,
          password: event.user.password,
        ),
      );
      yield LoginEndLoading();
      yield result.fold((error) => ErrorState(error.runtimeType.toString()),
          (response) => LoginResponseState(response));
    } else if (event is GetLoginError) {
      yield ErrorState(event.message);
    } else if (event is OnChangedValuesEvent) {
      bool isEnabled =
          (!isBlank(event?.user?.email) && !isBlank(event?.user?.password));
      yield EnableLoginButtonState(event.user, isEnabled);
    } else if(event is CallApiForForgotPasswordEvent) {
      final result = await getLoginRepository.getResetPasswordResponse(event.resetPasswordModel);

      yield ResponseFromResetPasswordAPICall(result.statusCode);
    } else if (event is CallApiSetPasswordEvent) {
      final result = await getLoginRepository.getSetPasswordResponse(event.setPasswordModel);

      yield ResponseFromSetPasswordAPICall(result.statusCode);
    }
  }
}
