import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';
import 'package:scrips_core/widgets/general/space.dart';
import 'package:scrips_shared_features/features/create_password/data/datamodels/signup_user_data_model.dart';
import 'package:scrips_shared_features/generated/l10n.dart';

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
                  S.of(context).welcomeTo +
                      " ${userData?.name ?? "..."} " +
                      S.of(context).OnScrips,
                  style: normalLabelTextStyle(15, regularTextColor),
                ),
                Space(
                  vertical: 16,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: normalLabelTextStyle(15, regularTextColor),
                    text: S.of(context).pleaseCompleteYourRegistrationForYour,
                    children: <TextSpan>[
                      TextSpan(
                          text: ' ${userData?.emailAddress ?? "..."}\n',
                          style: boldLabelTextStyle(15, regularTextColor)),
                      TextSpan(
                        text: S.of(context).accountByCreatingAPassword,
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
