import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class PasswordChangedSuccessBloc
    extends Bloc<PasswordChangedSuccessEvent, PasswordChangedSuccessState> {
  @override
  PasswordChangedSuccessState get initialState =>
      InitialPasswordChangedSuccessState();

  @override
  Stream<PasswordChangedSuccessState> mapEventToState(
    PasswordChangedSuccessEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
