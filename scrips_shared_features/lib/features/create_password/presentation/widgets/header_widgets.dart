import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';

List<Widget> headerWidgets(
        BuildContext context, isLoading, SignUpUserData userData) =>
    [
      Space(
        vertical: 12,
      ),
      isLoading
          ? Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Center(
                    child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(enabledBtnBGColor),
                        ))),
              ),
            )
          : Column(
              children: <Widget>[
                Text(
                  "Hey Dr ${userData?.firstName ?? "..."},",
                  style: boldLabelTextStyle(17, textInputColor),
                ),
                Space(
                  vertical: 16,
                ),
                Text(
                  "Welcome to ${userData?.name ?? "..."} on Scrips.",
                  style: normalLabelTextStyle(15, regularTextColor),
                ),
                Space(
                  vertical: 16,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: normalLabelTextStyle(15, regularTextColor),
                    text: "Please, complete your registration for your",
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${userData?.emailAddress ?? "..."}\n',
                          style: boldLabelTextStyle(15, regularTextColor)),
                      TextSpan(
                        text: 'account by creating a password.',
                        style: normalLabelTextStyle(15, regularTextColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
      Space(
        vertical: 24,
      ),
    ];
