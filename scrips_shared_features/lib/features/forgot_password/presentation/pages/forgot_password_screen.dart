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
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:scrips_shared_features/features/forgot_password/presentation/bloc/forgot_password_state.dart';

import '../widgets/body_widgets.dart';
import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final bloc = sl<ForgotPasswordBloc>();
  String email;
  bool isLoading = false;
  bool isLoginLoading = false;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  void _goNext() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(
          context, AppRoutePaths.RestPasswordAccessCode,
          arguments: {
            "email": email,
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
            isEnabled = state.status;
          } else if (state is LoadingBeginState) {
            isLoading = true;
          } else if (state is LoadingEndState) {
            isLoading = false;
          } else if (state is ForgotPasswordSuccessState) {
            _goNext();
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
          }
        },
        child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
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
                  iconImage: Images.instance.banner(),
                  headerWidgets: headerWidgets(context),
                  bodyWidgets:
                      bodyWidgets(context: context, email: email, bloc: bloc),
                  footerWidgets: footerWidgets(
                    context: context,
                    email: email,
                    bloc: bloc,
                    isLoading: isLoading,
                    isLoginLoading: isLoginLoading,
                    isEnabled: isEnabled,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
