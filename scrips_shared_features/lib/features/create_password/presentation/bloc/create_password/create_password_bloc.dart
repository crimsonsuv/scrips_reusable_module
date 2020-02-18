import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class CreatePasswordBloc
    extends Bloc<CreatePasswordEvent, CreatePasswordState> {
  @override
  CreatePasswordState get initialState => InitialCreatePasswordState();

  @override
  Stream<CreatePasswordState> mapEventToState(
    CreatePasswordEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
