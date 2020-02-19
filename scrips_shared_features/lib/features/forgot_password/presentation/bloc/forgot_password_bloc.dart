import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  @override
  ForgotPasswordState get initialState => InitialForgotPasswordState();

  @override
  Stream<ForgotPasswordState> mapEventToState(
    ForgotPasswordEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
