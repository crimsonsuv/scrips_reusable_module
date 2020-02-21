import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';
import './bloc.dart';

class PasswordChangedSuccessBloc
    extends Bloc<PasswordChangedSuccessEvent, PasswordChangedSuccessState> {

  final OAuthLoginUseCase oAuthLoginUseCase;

  PasswordChangedSuccessBloc({
    @required this.oAuthLoginUseCase
  });

  @override
  PasswordChangedSuccessState get initialState =>
      InitialPasswordChangedSuccessState();

  @override
  Stream<PasswordChangedSuccessState> mapEventToState(
    PasswordChangedSuccessEvent event,
  ) async* {
     if(event is OAuthLoginEvent){
    yield LoginLoadingBeginState();
    final result = await oAuthLoginUseCase(
    NoParams());
    yield LoginLoadingEndState();
    yield result.fold(
    (error) => ErrorState(error.message),
    (success) => OAuthLoginState(success),
    );
    }
  }
}
