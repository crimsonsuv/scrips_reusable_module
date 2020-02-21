import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_shared_features/core/base/screens/simple_view.dart';
import 'package:scrips_shared_features/core/constants/app_config.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/landing/presentation/bloc/landing/landing_bloc.dart';
import 'package:scrips_shared_features/features/landing/presentation/widgets/body_widgets.dart';
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
  User user;

  @override
  void initState() {
    bloc.dispatch(GetLoggedUser());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bloc.dispose();
  }

  void _goToHomeIfLoggedIn(User user) {
    final bool isLoggedIn =
        user?.userId?.value != null && user?.userId?.value != '';
    if (isLoggedIn && Configuration.goToHomeIfLoggedIn) {
      // we need to call this to ensure menu items are loaded, etc
      Future.delayed(Duration(milliseconds: 100), () {
        Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
      });
    }
  }

  void _fetchUser(User loggedUser) {
    user = loggedUser;
  }

  void _goToLogin() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.Login);
    });
  }

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
    return BlocProvider<LandingBloc>(
        builder: (_) => bloc,
        child: BlocBuilder<LandingBloc, LandingState>(
            bloc: bloc,
            builder: (context, state) {
              if (state is GetLoggedUserState) {
                _fetchUser(state.user);
              }
              _goToHomeIfLoggedIn(user);
              return Scaffold(
                backgroundColor: bgColor,
                body: Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: SimpleView(
                    showBackButton: false,
                    showAppIcon: true,
                    showNext: false,
                    iconImage: Images.instance.banner(),
                    onBack: () {},
                    onNext: () {},
                    headerWidgets: headerWidgets(context),
                    bodyWidgets: bodyWidgets(context),
                    footerWidgets: footerWidgets(
                        context, _goToLogin, _goToSignup, _goToForgotPassword),
                  ),
                ),
              );
            }));
  }
}
