import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';

import '../bloc/create_password/create_password_bloc.dart';
import '../bloc/create_password/create_password_state.dart';
import '../widgets/body_widgets.dart';
import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class CreatePasswordScreen extends StatefulWidget {
  CreatePasswordScreen({Key key}) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final bloc = sl<CreatePasswordBloc>();
  User _user;

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
    return BlocProvider<CreatePasswordBloc>(
      builder: (_) => sl<CreatePasswordBloc>(),
      child: BlocBuilder<CreatePasswordBloc, CreatePasswordState>(
          bloc: bloc,
          builder: (context, state) {
            return Scaffold(
              body: SimpleView(
                showBackButton: true,
                showAppIcon: true,
                showNext: false,
                iconImage: Images.instance.organization(),
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
