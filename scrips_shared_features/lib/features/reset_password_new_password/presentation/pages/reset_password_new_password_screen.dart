import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/reset_password_new_password/presentation/bloc/bloc.dart';

import '../widgets/body_widgets.dart';
import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class ResetPasswordNewPasswordScreen extends StatefulWidget {
  ResetPasswordNewPasswordScreen({Key key}) : super(key: key);

  @override
  _ResetPasswordNewPasswordScreenState createState() =>
      _ResetPasswordNewPasswordScreenState();
}

class _ResetPasswordNewPasswordScreenState
    extends State<ResetPasswordNewPasswordScreen> {
  final bloc = sl<ResetPasswordNewPasswordBloc>();

  @override
  void initState() {
    super.initState();
  }

  void _goToHome() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
    });
  }

  void _goNext() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(
          context, AppRoutePaths.PasswordChangedSuccess);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordNewPasswordBloc>(
      builder: (_) => sl<ResetPasswordNewPasswordBloc>(),
      child: BlocBuilder<ResetPasswordNewPasswordBloc,
              ResetPasswordNewPasswordState>(
          bloc: bloc,
          builder: (context, state) {
            return Scaffold(
              body: SimpleView(
                showBackButton: true,
                showAppIcon: true,
                showNext: false,
                iconImage: Images.instance.banner(),
                onBack: () {},
                onNext: () {},
                headerWidgets: headerWidgets(context),
                bodyWidgets: bodyWidgets(context),
                footerWidgets: footerWidgets(
                    context: context,
                    goToHome: _goToHome,
                    goNext: _goNext,
                    email: "suv.das19@gmail.com"),
              ),
            );
          }),
    );
  }
}
