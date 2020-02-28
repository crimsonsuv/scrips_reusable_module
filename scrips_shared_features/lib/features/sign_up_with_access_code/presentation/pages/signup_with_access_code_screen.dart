import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/bloc/bloc.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/widgets/body_widgets.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/widgets/footer_widgets.dart';
import 'package:scrips_shared_features/features/sign_up_with_access_code/presentation/widgets/header_widgets.dart';

final Color welcomeTextColor = getColorFromHex('#000000');

class SignUpScreen extends StatefulWidget {
  final Widget next;

  const SignUpScreen({Key key, this.next}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final bloc = sl<SignupWithAccessCodeBloc>();
  String email = "";
  String accessCode = "";
  bool isLoading = false;
  bool isLoginLoading = false;
  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  void _goNext({String email, String passwordResetToken}) {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.CreatePassword, arguments: {
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
            }
          },
          child:
              BlocBuilder<SignupWithAccessCodeBloc, SignupWithAccessCodeState>(
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
                  bodyWidgets: bodyWidgets(
                      context: context,
                      email: email,
                      accessCode: accessCode,
                      bloc: bloc),
                  footerWidgets: footerWidgets(
                      context: context,
                      email: email,
                      accessCode: accessCode,
                      bloc: bloc,
                      isLoading: isLoading,
                      isLoginLoading: isLoginLoading,
                      isEnabled: isEnabled),
                ),
              );
            },
          )),
    );
  }
}
