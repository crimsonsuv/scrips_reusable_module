import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/password_changed_success/presentation/bloc/bloc.dart';

import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class PasswordChangedSuccessScreen extends StatefulWidget {
  PasswordChangedSuccessScreen({Key key}) : super(key: key);

  @override
  _PasswordChangedSuccessScreenState createState() =>
      _PasswordChangedSuccessScreenState();
}

class _PasswordChangedSuccessScreenState
    extends State<PasswordChangedSuccessScreen> {
  final bloc = sl<PasswordChangedSuccessBloc>();

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
          context, AppRoutePaths.RestPasswordNewPassword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordChangedSuccessBloc>(
      builder: (_) => sl<PasswordChangedSuccessBloc>(),
      child:
          BlocBuilder<PasswordChangedSuccessBloc, PasswordChangedSuccessState>(
              bloc: bloc,
              builder: (context, state) {
                return Scaffold(
                  body: SimpleView(
                    showBackButton: true,
                    showAppIcon: true,
                    showNext: false,
                    iconImage: Images.instance.bigSuccess(),
                    onBack: () {},
                    onNext: () {},
                    headerWidgets: headerWidgets(context),
                    bodyWidgets: [],
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
