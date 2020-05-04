import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/reset_password_access_code/presentation/bloc/bloc.dart';

import '../widgets/body_widgets.dart';
import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class ResetPasswordAccessCodeScreen extends StatefulWidget {
  final Map<String, String> arguments;
  ResetPasswordAccessCodeScreen({Key key, this.arguments}) : super(key: key);

  @override
  _ResetPasswordAccessCodeScreenState createState() =>
      _ResetPasswordAccessCodeScreenState();
}

class _ResetPasswordAccessCodeScreenState
    extends State<ResetPasswordAccessCodeScreen> {
  final bloc = sl<ResetPasswordAccessCodeBloc>();
  String email;
  String accessCode = "";
  bool isLoading = false;
  bool isLoginLoading = false;
  bool isScreenLoading = false;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    email = widget.arguments["email"];
  }

  void _goNext({String email, String passwordResetToken}) {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(
          context, AppRoutePaths.RestPasswordNewPassword, arguments: {
        "email": email,
        "passwordResetToken": passwordResetToken
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
        bloc: bloc,
        listener: (BuildContext context, state) {
          if (state is IsButtonEnabledState) {
            email = state.email;
            accessCode = state.code;
            isEnabled = state.status;
          } else if (state is LoadingBeginState) {
            isLoading = true;
          } else if (state is LoadingEndState) {
            isLoading = false;
          } else if (state is SignupSuccessState) {
            _goNext(
                email: state.signupByCodeResponse.emailAddress,
                passwordResetToken:
                    state.signupByCodeResponse.passwordResetToken);
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
          } else if (state is LoginLoadingBeginState) {
            isLoginLoading = true;
          } else if (state is LoginLoadingEndState) {
            isLoginLoading = false;
          } else if (state is OAuthLoginState) {
            print("ACCESS CODE IS : ${state.userData.emailAddress}");
            goToHome(context: context, userData: state.userData);
          } else if (state is LoadingScreenBeginState) {
            isScreenLoading = true;
          } else if (state is LoadingScreenEndState) {
            isScreenLoading = false;
          }
        },
        child: BlocBuilder<ResetPasswordAccessCodeBloc,
                ResetPasswordAccessCodeState>(
            bloc: bloc,
            condition: (preSate, currSate) {
              if (currSate is IsButtonEnabledState) {
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
                  iconImage: Images.instance.bigSuccess(),
                  headerWidgets: headerWidgets(context),
                  bodyWidgets: bodyWidgets(
                      context: context,
                      code: accessCode,
                      bloc: bloc,
                      isLoading: isScreenLoading,
                      email: email),
                  footerWidgets: footerWidgets(
                      context: context,
                      bloc: bloc,
                      accessCode: accessCode,
                      email: email,
                      isLoading: isLoading,
                      isLoginLoading: isLoginLoading,
                      isEnabled: isEnabled),
                ),
              );
            }),
      ),
    );
  }
}
