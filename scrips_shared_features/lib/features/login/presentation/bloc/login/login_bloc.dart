import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/get_login_response_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginResponseUseCase getLoginResponseUseCase;

  LoginBloc({
    @required GetLoginResponseUseCase loginResponseUseCase,
  })  : assert(loginResponseUseCase != null),
        getLoginResponseUseCase = loginResponseUseCase;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SetLoginDummyDataEvent) {
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
    }
  }
}
