import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ResetPasswordNewPasswordBloc
    extends Bloc<ResetPasswordNewPasswordEvent, ResetPasswordNewPasswordState> {
  @override
  ResetPasswordNewPasswordState get initialState =>
      InitialResetPasswordNewPasswordState();

  @override
  Stream<ResetPasswordNewPasswordState> mapEventToState(
    ResetPasswordNewPasswordEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
