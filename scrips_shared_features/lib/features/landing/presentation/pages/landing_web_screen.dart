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
import 'package:scrips_shared_features/features/landing/presentation/bloc/landing/landing_bloc.dart';
import 'package:scrips_shared_features/features/landing/presentation/widgets/footer_widgets.dart';
import 'package:scrips_shared_features/features/landing/presentation/widgets/header_widgets.dart';

class LandingWebScreen extends StatefulWidget {
  const LandingWebScreen({
    Key key,
  }) : super(key: key);

  @override
  _LandingWebScreenState createState() => _LandingWebScreenState();
}

class _LandingWebScreenState extends State<LandingWebScreen> {
  final bloc = sl<LandingBloc>();
  bool isLoading = false;

  @override
  void initState() {
    bloc.add(GetLoggedUser());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

//  void _goToHomeIfLoggedIn(User user) {
//    final bool isLoggedIn =
//        user?.userId?.value != null && user?.userId?.value != '';
//    if (isLoggedIn && Configuration.goToHomeIfLoggedIn) {
//      // we need to call this to ensure menu items are loaded, etc
//      Future.delayed(Duration(milliseconds: 100), () {
//        Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
//      });
//    }
//  }

  void _goToSignup() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.SignUp);
    });
  }

  void _goToForgotPassword() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.ForgotPassword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
          bloc: bloc,
          listener: (BuildContext context, state) {
            if (state is OAuthLoginState) {
              print("ACCESS CODE IS : ${state.userData.emailAddress}");
              goToHome(context: context, userData: state.userData);
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
            } else if (state is LoadingBeginState) {
              isLoading = true;
            } else if (state is LoadingEndState) {
              isLoading = false;
            }
          },
          child: BlocBuilder<LandingBloc, LandingState>(
              bloc: bloc,
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: bgColor,
                  body: Padding(
                    padding: const EdgeInsets.only(top: 200),
                    child: SimpleView(
                      showBackButton: false,
                      showAppIcon: true,
                      showNext: false,
                      iconImage: Images.instance.banner(),
                      headerWidgets: headerWidgets(context: context),
                      bodyWidgets: [Container()],
                      footerWidgets: footerWidgets(
                          context: context,
                          goToForgotPassword: _goToForgotPassword,
                          goToSignup: _goToSignup,
                          bloc: bloc,
                          isLoading: isLoading),
                    ),
                  ),
                );
              })),
    );
  }
}
