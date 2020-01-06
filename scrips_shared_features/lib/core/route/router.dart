import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrips_core/constants/app_routes.dart';

import 'app_route_paths.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // todo: sumeet: platformPageRoute throws errors - need to check
    switch (settings.name) {
//      case AppRoutePaths.Landing:
//        return MaterialPageRoute(
//            builder: (_) => LandingBaseScreen(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ),
//            settings: RouteSettings(name: settings.name));
//        break;
//      case AppRoutePaths.Login:
//        return MaterialPageRoute(
//            builder: (_) => LoginBaseScreen(
//                  key: ObjectKey(settings.name),
//                ),
//            settings: RouteSettings(name: settings.name));
//        break;
//      case AppRoutePaths.SignUp:
//        return MaterialPageRoute(
//            builder: (_) => SignUpBaseScreen(
//                  key: ObjectKey(settings.name),
//                ),
//            settings: RouteSettings(name: settings.name));
//        break;
//      case AppRoutePaths.Home:
//        return MaterialPageRoute(
//            builder: (_) => homeView(settings),
//            settings: RouteSettings(name: settings.name));
//        break;
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.OrganizationList,
//                  mainSubMenuPath: RoutePaths.OrganizationList1,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    OrganizationList(),
//                    //PracticeOnBoardingWizardPanel(),
//                  ],
//                ));
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.PracticeOnBoardingWizard,
//                  mainSubMenuPath: RoutePaths.PracticeOnBoardingWizardSubMenu2,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    PracticeSetupBaseScreen(),
//                  ],
//                ),
//            settings: RouteSettings(name: settings.name));
//        break;
//      case AppRoutePaths.CreatePassword:
//        return MaterialPageRoute(
//            builder: (_) => CreatePasswordBaseScreen(
//                  key: ObjectKey(settings.name),
//                ),
//            settings: RouteSettings(name: settings.name));
//        break;
//
//      //--Below this old codes are used --
//      case RoutePaths.Splash:
//        return MaterialPageRoute(
//            builder: (_) => SplashView(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.LoginSignUp:
//        return MaterialPageRoute(
//            builder: (_) => LoginOrSignUp(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.LoginSignUpWithAccessCode:
//        return MaterialPageRoute(
//            builder: (_) => LoginOrSignUpWithAccessCode(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.PmSignUpStepWithAccessCode:
//        return MaterialPageRoute(
//            builder: (_) => SignUpStepWithAccessCode(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.PmSignUpStepCreatePassword:
//        return MaterialPageRoute(
//            builder: (_) => SignUpStepCreatePassword(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.PmSignUpStep1:
//        return MaterialPageRoute(
//            builder: (_) => SignUpStep1(
//                  key: ObjectKey(settings.name),
//                  // next: homeView(settings),
//                ));
//        break;
//      case RoutePaths.PmSignUpStep2:
//        return MaterialPageRoute(builder: (_) => SignUpStep2());
//        break;
//      case RoutePaths.PmSignUpStep3:
//        return MaterialPageRoute(builder: (_) => SignUpStep3());
//        break;
//      case RoutePaths.PmSignUpInvite:
//        return MaterialPageRoute(builder: (_) => SignUpInvite());
//        break;
//
//      case RoutePaths.PmSignUpAddManager:
//        return MaterialPageRoute(builder: (_) => SignUpAddManager());
//        break;
//      case RoutePaths.PmSignUpQuestion:
//        return MaterialPageRoute(builder: (_) => SignUpQuestion());
//        break;
//      case RoutePaths.PmForgotPassword:
//        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
//        break;
//      case RoutePaths.EnterSignUpAccessCode:
//        return MaterialPageRoute(builder: (_) => SignUpEnterAccessCode());
//        break;
//
//      case RoutePaths.PmEnterNewPassword:
//        return MaterialPageRoute(builder: (_) => EnterNewPassword());
//        break;
//      case RoutePaths.PmPasswordSent:
//        return MaterialPageRoute(builder: (_) => PasswordSent());
//      case RoutePaths.PmSignUpQuestionSuccess:
//        return MaterialPageRoute(builder: (_) => SignUpQueSuccess());

//      case RoutePaths.Empty:
//      case RoutePaths.HomeSubMenu1:
//        return MaterialPageRoute(builder: (_) => homeView(settings));
//        break;
//      case RoutePaths.PracticeOnBoardingWizard:
//      case RoutePaths.PracticeOnBoardingWizardSubMenu1:
//        return MaterialPageRoute(builder: (_) => homeView(settings));
//        break;
//      case RoutePaths.OrganizationList:
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.OrganizationList,
//                  mainSubMenuPath: RoutePaths.OrganizationList1,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    OrganizationList(),
//                    //PracticeOnBoardingWizardPanel(),
//                  ],
//                ));
//        break;
//      case RoutePaths.Settings:
//      case RoutePaths.SettingsSubMenu1:
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.Settings,
//                  mainSubMenuPath: RoutePaths.SettingsSubMenu1,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    SettingsPanel(),
//                  ],
//                ));
//        break;
//      case RoutePaths.SettingsSubMenu2:
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.Settings,
//                  mainSubMenuPath: RoutePaths.SettingsSubMenu2,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    SettingsPanel2(),
//                  ],
//                ));
//        break;
//      case RoutePaths.CreateOrganization:
//        //return MaterialPageRoute(builder: (_) => CreateOrgDetailsView());
//        return MaterialPageRoute(
//            builder: (_) => MainView(
//                  mainMenuPath: RoutePaths.CreateOrganization,
//                  mainSubMenuPath: RoutePaths.CreateOrganization1,
//                  navigateArgs: settings?.arguments,
//                  children: <Widget>[
//                    CreateOrgDetailsView(settings.arguments),
//                    //PracticeOnBoardingWizardPanel(),
//                  ],
//                ));
//        break;
//
//      case RoutePaths.PmLoginView:
//      default:
//        return MaterialPageRoute(
//            builder: (context) => MainView(
//                  mainMenuPath: RoutePaths.Undefined,
//                  mainSubMenuPath: null,
//                  children: <Widget>[
//                    UndefinedView(
//                      name: settings?.name,
//                    ),
//                  ],
//                ));
//        break;
    }
  }
}
