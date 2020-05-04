import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/create_password_use_case.dart';
import 'package:scrips_shared_features/features/create_password/domain/usecase/signup_user_data_use_case.dart';
import 'package:validators/validators.dart';

import './bloc.dart';

class CreatePasswordBloc
    extends Bloc<CreatePasswordEvent, CreatePasswordState> {
  final SignUpUserDataUseCase signUpUserDataUseCase;
  final CreatePasswordUseCase createPasswordUseCase;

  CreatePasswordBloc({
    @required this.createPasswordUseCase,
    @required this.signUpUserDataUseCase,
  });

  @override
  CreatePasswordState get initialState => InitialCreatePasswordState();

  @override
  Stream<CreatePasswordState> mapEventToState(
    CreatePasswordEvent event,
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
    } else if (event is GetUserData) {
      yield LoadingScreenBeginState();
      final result = await signUpUserDataUseCase(SignUpUserDataParams(
        email: event.email,
      ));
      yield LoadingScreenEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => UserDataSuccessState(userData: success),
      );
    }
  }
}
