// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get pm_app_name {
    return Intl.message(
      'Practice Management',
      name: 'pm_app_name',
      desc: '',
      args: [],
    );
  }

  String get pa_app_name {
    return Intl.message(
      'Provider',
      name: 'pa_app_name',
      desc: '',
      args: [],
    );
  }

  String get welcomeTo {
    return Intl.message(
      'Welcome to',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  String get pleaseEnterYourLoginDetails {
    return Intl.message(
      'Please, enter your login details',
      name: 'pleaseEnterYourLoginDetails',
      desc: '',
      args: [],
    );
  }

  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  String get signUpWithAccessCode {
    return Intl.message(
      'Sign Up With Access Code',
      name: 'signUpWithAccessCode',
      desc: '',
      args: [],
    );
  }

  String get pleaseCompleteYourRegistrationForYour {
    return Intl.message(
      'Please, complete your registration for your',
      name: 'pleaseCompleteYourRegistrationForYour',
      desc: '',
      args: [],
    );
  }

  String get OnScrips {
    return Intl.message(
      'on Scrips.',
      name: 'OnScrips',
      desc: '',
      args: [],
    );
  }

  String get accountByCreatingAPassword {
    return Intl.message(
      'account by creating a password.',
      name: 'accountByCreatingAPassword',
      desc: '',
      args: [],
    );
  }

  String get completeSignUp {
    return Intl.message(
      'Complete Sign Up',
      name: 'completeSignUp',
      desc: '',
      args: [],
    );
  }

  String get byCompletingSigningUpYouAcceptThe {
    return Intl.message(
      'By completing Signing Up you accept the',
      name: 'byCompletingSigningUpYouAcceptThe',
      desc: '',
      args: [],
    );
  }

  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('ar', ''), Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}