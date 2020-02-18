import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_shared_features/core/usecase/no_params.dart';
import 'package:scrips_shared_features/features/sign_up/domain/usecases/get_user_sign_up_use_case.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  GetUserSignUpUseCase getUserSignUpUseCase;

  SignUpBloc({@required this.getUserSignUpUseCase});

  @override
  SignUpState get initialState => InitialSignUpState();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SetSignUpDummyData) {
      String accessCode = "123456";
      yield SignUpDummyDataState(accessCode);
    } else if (event is GetUserSignUp) {
      final result = await getUserSignUpUseCase(NoParams());

      yield result.fold(
        (error) => ErrorState(
          error.runtimeType.toString(),
        ),
        (user) => user != null
            ? GetUserSignUpState(user)
            : ErrorState("User is null"),
      );
    }
  }
}
