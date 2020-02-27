import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';

import './bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final OAuthLoginUseCase oAuthLoginUseCase;

  ForgotPasswordBloc({
    @required this.forgotPasswordUseCase,
    @required this.oAuthLoginUseCase,
  });

  @override
  ForgotPasswordState get initialState => InitialForgotPasswordState();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    if (event is ForgotPasswordCallEvent) {
      yield LoadingBeginState();
      final result = await forgotPasswordUseCase(ForgotPasswordParams(
        email: event.email,
      ));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => ForgotPasswordSuccessState(),
      );
    } else if (event is OAuthLoginEvent) {
      yield LoginLoadingBeginState();
      final result = await oAuthLoginUseCase(NoParams());
      yield LoginLoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => OAuthLoginState(success),
      );
    } else if (event is EnabledButtonEvent) {
      bool status = !isBlank(event.email);
      yield IsButtonEnabledState(status: status, email: event.email);
    }
  }
}
