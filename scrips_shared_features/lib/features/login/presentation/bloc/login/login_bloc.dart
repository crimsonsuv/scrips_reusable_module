import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/get_login_response_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginResponseUseCase getLoginResponseUseCase;

  User user;

  LoginBloc({
    @required GetLoginResponseUseCase loginResponseUseCase,
  })  : assert(loginResponseUseCase != null),
        getLoginResponseUseCase = loginResponseUseCase;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    String dummyUserName = "admin@scrips.com";
    String dummyUserPassword = "123456";
    if (event is SetLoginDummyDataEvent) {
      user = User(email: dummyUserName, password: dummyUserPassword);
      yield LoginDummyDataState(user);
    } else if (event is GetLoginResponseEvent) {
      yield LoginLoading(true);
      final result = await getLoginResponseUseCase(
        Params(
          context: event.context,
          email: user.email,
          password: user.password,
        ),
      );
      yield LoginLoading(false);
      yield result.fold((error) => ErrorState(error.runtimeType.toString()),
          (response) => LoginResponseState(response));
    } else if (event is GetLoginError) {
      yield ErrorState(event.message);
    } else if (event is OnChangedValues) {
      user = User(email: event.email, password: event.password);
    }
  }
}
