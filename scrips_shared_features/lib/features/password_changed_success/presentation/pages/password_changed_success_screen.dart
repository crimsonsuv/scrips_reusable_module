import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/core/util/utils.dart';
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
  bool isLoginLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: BlocListener(
        bloc: bloc,
        listener: (BuildContext context, state) {
          if (state is ErrorState) {
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
        child: BlocBuilder<PasswordChangedSuccessBloc,
                PasswordChangedSuccessState>(
            bloc: bloc,
            builder: (context, state) {
              return Scaffold(
                body: SimpleView(
                  showBackButton: true,
                  showAppIcon: true,
                  showNext: false,
                  iconImage: Images.instance.bigSuccess(),
                  headerWidgets: headerWidgets(context),
                  bodyWidgets: [],
                  footerWidgets: footerWidgets(
                      context: context, bloc: bloc, isLoading: isLoginLoading),
                ),
              );
            }),
      ),
    );
  }
}
