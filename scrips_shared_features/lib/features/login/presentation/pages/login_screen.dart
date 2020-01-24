import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_assets.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
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
  LoginResponse loginResponse;
  bool response = false;
  bool isLoading = false;
  User initialUser;
  User editedUser;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    initialUser = User();
    editedUser = User();
    bloc.dispatch(
      SetLoginDummyDataEvent(context),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  void _goToHome(LoginResponse response) {
    if (response != null && response.success) {
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.pushReplacementNamed(context, AppRoutePaths.Home,
            arguments: response.user.userId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is LoginDummyDataState) {
              initialUser = state.user;
              editedUser = state.user;
            } else if (state is LoginResponseState) {
              _goToHome(state.response);
            } else if (state is LoginBeginLoading) {
              isLoading = true;
            } else if (state is LoginEndLoading) {
              isLoading = false;
            } else if (state is ErrorState) {
              print(state.message);
              //TODO provide UI for error
            } else if (state is EnableLoginButtonState) {
              isEnabled = state.status;
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: bloc,
            condition: (preSate, currSate) {
              if (currSate is EnableLoginButtonState) {
                return false;
              }
              return true;
            },
            builder: (context, state) {
              return Scaffold(
                body: SimpleView(
                  showBackButton: true,
                  showAppIcon: true,
                  showNext: false,
                  iconImage: Images.instance.banner(),
                  onBack: () {},
                  onNext: () {},
                  headerWidgets: headerWidgets(context, 'Welcome to Scrips® Provider App', 'Please, enter your login details' ),
                  bodyWidgets:
                      bodyWidgets(context, initialUser, editedUser, bloc),
                  footerWidgets: footerWidgets(
                      editedUser, context, isLoading, bloc, isEnabled, true),
                ),
              );
            },
          )),
    );
  }
}
