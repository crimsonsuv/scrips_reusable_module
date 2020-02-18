import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/data_models/user/user.dart';
import 'package:scrips_core/utils/utils.dart';
import 'package:scrips_core/widgets/general/simple_view.dart';
import 'package:scrips_shared_features/core/route/app_route_paths.dart';
import 'package:scrips_shared_features/di/dependency_injection.dart';
import 'package:scrips_shared_features/features/sign_up/presentation/bloc/sign_up/sign_up_bloc.dart';
import 'package:scrips_shared_features/features/sign_up/presentation/widgets/body_widgets.dart';
import 'package:scrips_shared_features/features/sign_up/presentation/widgets/footer_widgets.dart';
import 'package:scrips_shared_features/features/sign_up/presentation/widgets/header_widgets.dart';

final Color welcomeTextColor = getColorFromHex('#000000');

class SignUpScreen extends StatefulWidget {
  final Widget next;

  const SignUpScreen({Key key, this.next}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final bloc = sl<SignUpBloc>();
  User user;
  String accessCode;

  @override
  void initState() {
    super.initState();
    bloc.dispatch(
      SetSignUpDummyData(),
    );
  }

  void _goToLogin() {
    Navigator.pop(context);
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.Login);
    });
  }

  void _goNext() {
    Future.delayed(Duration(milliseconds: 100), () {
      Navigator.pushNamed(context, AppRoutePaths.CreatePassword);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        builder: (_) => bloc,
        child: BlocBuilder<SignUpBloc, SignUpState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is SignUpDummyDataState) {
              accessCode = state.accessCode;
            }
            return Scaffold(
              body: SimpleView(
                showBackButton: true,
                showAppIcon: true,
                showNext: false,
                iconImage: Images.instance.banner(),
                onBack: () {},
                onNext: () {
                  //Navigator.pushNamed(context, RoutePaths.PmSignUpStep2);
                },
                headerWidgets: headerWidgets(context),
                bodyWidgets: bodyWidgets(context, accessCode),
                footerWidgets:
                    footerWidgets(context, _goNext, _goToLogin, accessCode),
              ),
            );
          },
        ));
  }
}
