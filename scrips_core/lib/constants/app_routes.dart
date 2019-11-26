// You can also just let this float around in the file without encapsulating
// in a class. Then you'll have to make sure that system wide you don't have
// duplicate variable names.
class RoutePaths {
  // paths common to all; 4 apps
  static const String Splash = 'splash';
  static const String Login = 'login';
  static const String Home = '/';
  static const String Settings = '/settings';
  static const String Undefined = '/undefined-route';
  static const String SettingsLocale = 'settings-locale';
  static const String Empty = '';
  static const String HomeSubMenu1 = '/1';

  // test temp paths - delete when not needed
  static const String PmSettings = '/pm-settings';
  static const String PmSignUpStep1 = 'pm_sign_up_step1';
  static const String PmSignUpStep2 = 'pm_sign_up_step2';
  static const String PmSignUpStep3 = 'pm_sign_up_step3';
  static const String PmSignUpAddManager = 'pm_sign_up_add_manager';
  static const String PmSignUpInvite = 'pm_sign_up_invite';
  static const String PmSignUpQuestion = 'pm_sign_up_question';
  static const String PmLoginView = 'pm_login';
  static const String PmForgotPassword = 'pm_forgot_password';
  static const String PmEnterNewPassword = 'pm_enter_new_password';
  static const String PmPasswordSent = 'pm_password_sent';
  static const String LoginView = 'login_view';

  //   temp test paths
  static const String PracticeOnBoardingWizard = '/practice-onboard-wizard';
  static const String PracticeOnBoardingWizardSubMenu1 = '/practice-onboard-wizard-1';
  static const String PracticeOnBoardingWizardSubMenu2 = '/practice-onboard-wizard-2';
  static const String SettingsSubMenu1 = '/settings-1';
  static const String SettingsSubMenu2 = '/settings-2';
  static const String LocationView = 'location-view';
  static const String DialogTest = 'dialog-test';
}
