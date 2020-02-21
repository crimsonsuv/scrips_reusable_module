import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ResetPasswordAccessCodeBloc
    extends Bloc<ResetPasswordAccessCodeEvent, ResetPasswordAccessCodeState> {
  @override
  ResetPasswordAccessCodeState get initialState =>
      InitialResetPasswordAccessCodeState();

  @override
  Stream<ResetPasswordAccessCodeState> mapEventToState(
    ResetPasswordAccessCodeEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
