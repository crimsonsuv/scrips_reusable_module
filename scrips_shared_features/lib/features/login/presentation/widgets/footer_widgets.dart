import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:scrips_core/constants/app_routes.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/button.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_core/widgets/general/toast_widget.dart';
import 'package:scrips_shared_features/features/login/data/datamodels/login_reponse_model.dart';
import 'package:scrips_shared_features/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

//Future<oauth2.Client> getClient() async {
//  final authorizationEndpoint = Uri.parse(
//      "https://scripsidentityapi20191030115107.azurewebsites.net/Account/Login");
//  final tokenEndpoint = Uri.parse(
//      "https://scripsidentityapi20191030115107.azurewebsites.net/connect/token");
//  final redirectUrl = Uri.parse("com.scrips.pa://");
//
//  var client = await oauth2.clientCredentialsGrant(
//      authorizationEndpoint, 'Scrips.Provider', "");
//
////  var grant = new oauth2.cl(
////    'Scrips.Provider',
////    authorizationEndpoint,
////    tokenEndpoint,
////  );
//  print(client.credentials);
//
//  //return await grant.handleAuthorizationResponse(request.queryParameters);
//}

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
                    if ((editedUser.email == "user@scrips.com" ||
                            editedUser.email == "admin@scrips.com") &&
                        editedUser.password == "123456") {
                      bloc.dispatch(
                        DoLoginEvent(context, editedUser),
                      );
                    } else {
                      showToastWidget(
                        ToastWidget(
                          message: "Email or Password is not correct",
                          backgroundColor: red,
                        ),
                        position: ToastPosition.top,
                        context: context,
                        duration: Duration(seconds: 2),
                      );
                    }

//                    var client = await getClient();
//                    print(client.credentials);
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
