import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/forgot_password/domain/usecase/forgot_password_use_case.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/usecases/signup_by_code_use_case.dart';

import './bloc.dart';

class ResetPasswordAccessCodeBloc
    extends Bloc<ResetPasswordAccessCodeEvent, ResetPasswordAccessCodeState> {
  final SignupByCodeUseCase signupByCodeUseCase;
  final OAuthLoginUseCase oAuthLoginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ResetPasswordAccessCodeBloc({
    @required this.signupByCodeUseCase,
    @required this.oAuthLoginUseCase,
    @required this.forgotPasswordUseCase,
  });

  @override
  ResetPasswordAccessCodeState get initialState =>
      InitialResetPasswordAccessCodeState();

  @override
  Stream<ResetPasswordAccessCodeState> mapEventToState(
    ResetPasswordAccessCodeEvent event,
  ) async* {
    if (event is SignupWithCodeEvent) {
      yield LoadingBeginState();
      final result = await signupByCodeUseCase(
          SignupByCodeParams(email: event.email, code: event.code));
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => SignupSuccessState(signupByCodeResponse: success),
      );
    } else if (event is EnabledButtonEvent) {
      bool status = !isBlank(event.email) && !isBlank(event.code);
      yield IsButtonEnabledState(
          status: status, email: event.email, code: event.code);
    } else if (event is OAuthLoginEvent) {
      yield LoginLoadingBeginState();
      final result = await oAuthLoginUseCase(NoParams());
      yield LoginLoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => OAuthLoginState(success),
      );
    } else if (event is ResendCodeCallEvent) {
      yield LoadingScreenBeginState();
      final result = await forgotPasswordUseCase(ForgotPasswordParams(
        email: event.email,
      ));
      yield LoadingScreenEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => ResendCodeSuccessState(),
      );
    }
  }
}
