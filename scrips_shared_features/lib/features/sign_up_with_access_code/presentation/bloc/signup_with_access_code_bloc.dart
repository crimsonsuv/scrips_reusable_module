import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/domain/usecases/signup_by_code_use_case.dart';
import './bloc.dart';

class SignupWithAccessCodeBloc
    extends Bloc<SignupWithAccessCodeEvent, SignupWithAccessCodeState> {
  final SignupByCodeUseCase signupByCodeUseCase;

  SignupWithAccessCodeBloc({
    @required this.signupByCodeUseCase,
  });

  @override
  SignupWithAccessCodeState get initialState =>
      InitialSignupWithAccessCodeState();

  @override
  Stream<SignupWithAccessCodeState> mapEventToState(
    SignupWithAccessCodeEvent event,
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
    }
  }
}
