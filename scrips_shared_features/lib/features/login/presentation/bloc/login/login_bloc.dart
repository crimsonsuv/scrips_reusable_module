import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/general/property_info.dart';
import 'package:scrips_shared_features/features/login/domain/usecase/get_login_response_use_case.dart';

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
    String dummyUserName = "user1@scrips.com";
    String dummyUserPassword = "123456";
    if (event is SetLoginDummyDataEvent) {
      User user = User(
          email: PropertyInfo(dummyUserName),
          password: PropertyInfo(dummyUserPassword));
      yield LoginDummyDataState(user);
    } else if (event is GetLoginResponseEvent) {
      yield LoginLoading(true);
      final result = await getLoginResponseUseCase(
        Params(
          context: event.context,
          email: event.email,
          password: event.password,
        ),
      );
      yield LoginLoading(false);
      yield result.fold((error) => ErrorState(error.runtimeType.toString()),
          (response) => LoginResponseState(response));
    } else if (event is GetLoginError) {
      yield ErrorState(event.message);
    }
  }
}
