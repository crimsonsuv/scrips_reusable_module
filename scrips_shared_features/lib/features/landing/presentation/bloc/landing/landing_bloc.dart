import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/landing/domain/usecases/get_logged_user_use_case.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
import 'package:scrips_shared_features/features/login/domain/usecases/oauth_login_use_case.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  GetLoggedUserUseCase getLoggedUserUseCase;
  OAuthLoginUseCase oAuthLoginUseCase;

  LandingBloc({@required this.getLoggedUserUseCase, this.oAuthLoginUseCase});

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
        (user) =>
            user != null ? GetLoggedUserState(user) : GetLoggedUserState(null),
      );
    } else if (event is OAuthLoginEvent) {
      yield LoadingBeginState();
      final result = await oAuthLoginUseCase(NoParams());
      yield LoadingEndState();
      yield result.fold(
        (error) => ErrorState(error.message),
        (success) => OAuthLoginState(success),
      );
    }
  }
}
