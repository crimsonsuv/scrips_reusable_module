import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/data_models/login/login.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/generated/i18n.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:scrips_shared_features/features/login/presentation/widgets/body_widgets.dart';
import 'package:scrips_shared_features/features/login/presentation/widgets/footer_widgets.dart';
import 'package:scrips_shared_features/features/login/presentation/widgets/header_widgets.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bloc = sl<LoginBloc>();
  User _user;
  LoginResponse loginResponse;
  bool response = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    bloc.dispatch(
      SetLoginDummyDataEvent(context),
    );
  }

  void _doLogin(User loginUser) async {
    String userEmail = loginUser.email.value;
    String userPassword = loginUser.password.value;
    if (isBlank(userEmail) || isBlank(userPassword)) {
      bloc.dispatch(GetLoginError(
          S.of(context).user_email_and_password_must_both_be_provided));
      return;
    }
    bloc.dispatch(
      GetLoginResponseEvent(
        context,
        userEmail,
        userPassword,
      ),
    );
  }

  void _goToHome(LoginResponse response) {
    if (response != null && response.success) {
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      builder: (_) => sl<LoginBloc>(),
      child: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoginDummyDataState) {
              _user = state.user;
            } else if (state is LoginResponseState) {
              _goToHome(state.response);
            } else if (state is LoginLoading) {
              isLoading = state.status;
            } else if (state is ErrorState) {
              print(state.message);
              //TODO provide UI for error
            }
            return Scaffold(
              body: SimpleView(
                showBackButton: true,
                showAppIcon: true,
                showNext: false,
                iconImage: Images.instance.banner(),
                onBack: () {},
                onNext: () {},
                headerWidgets: headerWidgets(context),
                bodyWidgets: bodyWidgets(_user, context),
                footerWidgets:
                    footerWidgets(_user, context, _doLogin, isLoading),
              ),
            );
          }),
    );
  }
}
