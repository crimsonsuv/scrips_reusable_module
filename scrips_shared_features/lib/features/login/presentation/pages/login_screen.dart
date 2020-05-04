import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_user_data_model.dart';
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
  LoginUserData loginResponse;
  bool response = false;
  bool isLoading = false;
  String email = "";
  String password = "";
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is LoginResponseState) {
              goToHome(context: context, userData: state.response);
              print(state.response.emailAddress);
            } else if (state is LoginBeginLoading) {
              isLoading = true;
            } else if (state is LoginEndLoading) {
              isLoading = false;
            } else if (state is ErrorState) {
              showToastWidget(
                ToastWidget(
                  message: state.message,
                  backgroundColor: red,
                ),
                position: ToastPosition.top,
                context: context,
                duration: Duration(seconds: 4),
              );
            } else if (state is EnableLoginButtonState) {
              email = state.email;
              password = state.password;
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
                  headerWidgets: headerWidgets(context),
                  bodyWidgets:
                      bodyWidgets(context: context, email: email, password: password, bloc: bloc),
                  footerWidgets: footerWidgets(email: email, password: password, context: context, bloc: bloc, isLoading: isLoading, isEnabled: isEnabled, shouldShowSignUpWithAccessCode: false),
                ),
              );
            },
          )),
    );
  }
}
