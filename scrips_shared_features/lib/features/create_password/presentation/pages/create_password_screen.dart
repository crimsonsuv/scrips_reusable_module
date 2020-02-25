import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';

import '../bloc/create_password/create_password_bloc.dart';
import '../bloc/create_password/create_password_state.dart';
import '../widgets/body_widgets.dart';
import '../widgets/footer_widgets.dart';
import '../widgets/header_widgets.dart';

class CreatePasswordScreen extends StatefulWidget {
  final Map<String, String> arguments;
  CreatePasswordScreen({Key key, this.arguments}) : super(key: key);

  @override
  _CreatePasswordScreenState createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final bloc = sl<CreatePasswordBloc>();
  String password = "";
  String confirmPassword = "";
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _goNext() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushReplacementNamed(
          context, AppRoutePaths.PasswordChangedSuccess);
    });
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
        bloc: bloc,
        listener: (BuildContext context, state) {
          if (state is IsButtonEnabledState) {
            password = state.password;
            confirmPassword = state.confirmPassword;
          } else if (state is LoadingBeginState) {
            isLoading = true;
          } else if (state is LoadingEndState) {
            isLoading = false;
          } else if (state is CreatePasswordSuccessState) {
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
          }
        },
        child: BlocBuilder<CreatePasswordBloc, CreatePasswordState>(
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
                  iconImage: Images.instance.organization(),
                  headerWidgets: headerWidgets(context),
                  bodyWidgets: bodyWidgets(
                      context: context,
                      password: password,
                      confirmPassword: confirmPassword,
                      bloc: bloc),
                  footerWidgets: footerWidgets(
                      context: context,
                      password: password,
                      confirmPassword: confirmPassword,
                      isLoading: isLoading,
                      arguments: widget.arguments,
                      bloc: bloc),
                ),
              );
            }),
      ),
    );
  }
}
