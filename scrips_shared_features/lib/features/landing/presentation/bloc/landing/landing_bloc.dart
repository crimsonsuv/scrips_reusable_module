import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/landing/domain/usecases/get_logged_user_use_case.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  GetLoggedUserUseCase getLoggedUserUseCase;

  LandingBloc({@required this.getLoggedUserUseCase});

  @override
  LandingState get initialState => InitialLandingState();

  @override
  Stream<LandingState> mapEventToState(LandingEvent event) async* {
    if (event is GetLoggedUser) {
      final result = await getLoggedUserUseCase(NoParams());

      yield result.fold(
        (error) => ErrorState(
          error.runtimeType.toString(),
        ),
        (user) => user != null
            ? GetLoggedUserState(user)
            : ErrorState("User is null"),
      );
    }
  }
}
