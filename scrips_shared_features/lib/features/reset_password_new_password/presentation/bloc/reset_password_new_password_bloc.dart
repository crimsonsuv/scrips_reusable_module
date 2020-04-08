import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/create_password_use_case.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';
import 'package:validators/validators.dart';

import './bloc.dart';

class ResetPasswordNewPasswordBloc
    extends Bloc<ResetPasswordNewPasswordEvent, ResetPasswordNewPasswordState> {
  final CreatePasswordUseCase createPasswordUseCase;
  final OAuthLoginUseCase oAuthLoginUseCase;

  ResetPasswordNewPasswordBloc({
    @required this.createPasswordUseCase,
    @required this.oAuthLoginUseCase,
  });

  @override
  ResetPasswordNewPasswordState get initialState =>
      InitialResetPasswordNewPasswordState();

  @override
  Stream<ResetPasswordNewPasswordState> mapEventToState(
    ResetPasswordNewPasswordEvent event,
  ) async* {
    if (event is EnabledButtonEvent) {
      bool valid = (event.password.length >= 8) &&
          matches(event.password, '[0-9]') &&
          matches(event.password, '[a-z]') &&
          matches(event.password, '[@, _, !, \$, %]') &&
          matches(event.password, '[A-Z]');
      bool status = valid && event.password == event.confirmPassword;
      yield IsButtonEnabledState(
          status: status,
          valid: valid,
          password: event.password,
          confirmPassword: event.confirmPassword);
    } else if (event is CreatePassEvent) {
      yield LoadingBeginState();
      final result = await createPasswordUseCase(CreatePasswordParams(
          email: event.email,
          password: event.password,
          passwordResetToken: event.passwordResetToken));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => CreatePasswordSuccessState(),
      );
    } else if (event is OAuthLoginEvent) {
      yield LoginLoadingBeginState();
      final result = await oAuthLoginUseCase(NoParams());
      yield LoginLoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => OAuthLoginState(success),
      );
    }
  }
}
