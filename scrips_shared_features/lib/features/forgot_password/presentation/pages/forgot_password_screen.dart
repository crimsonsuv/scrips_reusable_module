import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
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

  @override
  void initState() {
    super.initState();
  }

  void _goToHome() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(context, AppRoutePaths.Home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordBloc>(
      builder: (_) => sl<ForgotPasswordBloc>(),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
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
                footerWidgets: footerWidgets(context, _goToHome),
              ),
            );
          }),
    );
  }
}
