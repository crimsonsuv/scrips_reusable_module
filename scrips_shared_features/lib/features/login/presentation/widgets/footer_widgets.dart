import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';


void getAccessCode() async {

  final url = Uri.https(
      'scripsidentityapi20191030115107.azurewebsites.net', '/Account/Login', {
    'response_type':'code',
    'grant_type': 'authorization_code',
    'client_id': 'Scrips.Provider',
    'redirect_uri': 'com.scrips.pa://',
    'scope': 'openid',
  });

  final result = await FlutterWebAuth.authenticate(
    url: url.toString(),
    callbackUrlScheme: "com.scrips.pa",
  );

  final code = Uri.parse(result).queryParameters['code'];

  print(code);
}

List<Widget> footerWidgets(User editedUser, BuildContext context,
        bool isLoading, LoginBloc bloc, bool isEnabled,
        [bool shouldShowSignUpWithAccessCode]) =>
    <Widget>[
      Space(vertical: 62),
      BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is EnableLoginButtonState) {
            isEnabled = state.status;
          }
          return Button(
            width: 200.0,
            height: 48,
            text: "Login",
            buttonBackgroundColor:
                (isEnabled) ? normalBtnTextColor : disabledBtnBGColor,
            onPressed: (isEnabled)
                ? () async {
//                    if ((editedUser.email == "user@scrips.com" ||
//                            editedUser.email == "admin@scrips.com") &&
//                        editedUser.password == "123456") {
//                      bloc.dispatch(
//                        DoLoginEvent(context, editedUser),
//                      );
//                    } else {
//                      showToastWidget(
//                        ToastWidget(
//                          message: "Email or Password is not correct",
//                          backgroundColor: red,
//                        ),
//                        position: ToastPosition.top,
//                        context: context,
//                        duration: Duration(seconds: 2),
//                      );
//                    }

//                    var client = await getClient();
//                    print(client.credentials);
                    getAccessCode();
                  }
                : null,
            isLoading: isLoading,
            style: semiBoldLabelTextStyle(17.0, disabledBtnTextColor),
          );
        },
      ),
      Space(
        vertical: 24,
      ),
      Button(
        width: 222.0,
        height: 48,
        text: "Forgot Password?",
        style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.PmForgotPassword);
        },
        buttonBackgroundColor: bgColor,
      ),
      shouldShowSignUpWithAccessCode != null && shouldShowSignUpWithAccessCode
          ? Button(
              width: 222.0,
              height: 48,
              text: "Sign Up with access Code",
              style: semiBoldLabelTextStyle(17.0, normalBtnTextColor),
              onPressed: () {
                Navigator.pushNamed(
                    context, RoutePaths.PmSignUpStepWithAccessCode);
              },
              buttonBackgroundColor: bgColor,
            )
          : Container(),
    ];
