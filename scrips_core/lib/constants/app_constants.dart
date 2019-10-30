import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/locale/supported_locale.dart';

enum AppType {
  PM,
  PA,
  UA,
  UK,
}

// is Set from main.dart for usage across app
AppType currentAppType;

// is Set from main.dart for usage across app
String currentAppName = '';

const PM_APP_NAME = 'Scrips Practice Management';
const PM_APP_PRIMARY_SWATCH = Colors.blue;
const PM_APP_INITIAL_ROUTE = Colors.blue;
const PM_DEFAULT_LOCALE_CODE = 'en';
const PM_DEFAULT_LOCALE_COUNTRY = '';

const UK_APP_NAME = 'Scrips User Kisok';
const UK_APP_PRIMARY_SWATCH = Colors.blue;
const UK_APP_INITIAL_ROUTE = Colors.blue;
const UK_DEFAULT_LOCALE_CODE = 'en';
const UK_DEFAULT_LOCALE_COUNTRY = '';

const UA_APP_NAME = 'Scrips User App';
const UA_APP_PRIMARY_SWATCH = Colors.blue;
const UA_APP_INITIAL_ROUTE = Colors.blue;
const UA_DEFAULT_LOCALE_CODE = 'en';
const UA_DEFAULT_LOCALE_COUNTRY = '';

const PA_APP_NAME = 'Scrips Provider App';
const PA_APP_PRIMARY_SWATCH = Colors.blue;
const PA_APP_INITIAL_ROUTE = Colors.blue;
const PA_DEFAULT_LOCALE_CODE = 'en';
const PA_DEFAULT_LOCALE_COUNTRY = '';

final List<SupportedLocale> supportedLocales = [
  SupportedLocale(label: 'English', localeCode: 'en', localeCountry: ''),
  SupportedLocale(label: 'Arabic', localeCode: 'ar', localeCountry: ''),
];


String getCurrentAppName(BuildContext context, dynamic sInstance, AppType appType)
{
  if (sInstance != null ) {
    switch (currentAppType)
    {
      case AppType.PM:
        return sInstance.pm_app_name;
        break;
      case AppType.PA:
        return sInstance.pa_app_name;
        break;
      case AppType.UA:
        return sInstance.ua_app_name;
        break;
      case AppType.UK:
        return sInstance.uk_app_name;
        break;
      default:
        return '';
    }
  }  else
    return 'Scrips';
}

Color getCurrentAppPrimarySwatch(BuildContext context)
{
    switch (currentAppType)
    {
      case AppType.PM:
        return PM_APP_PRIMARY_SWATCH;
        break;
      case AppType.PA:
        return PA_APP_PRIMARY_SWATCH;
        break;
      case AppType.UA:
        return UA_APP_PRIMARY_SWATCH;
        break;
      case AppType.UK:
        return UK_APP_PRIMARY_SWATCH;
        break;
      default:
        return Colors.blue;
    }

}

void setCurrentAppType(BuildContext context, dynamic sInstance, AppType appType)
{
  currentAppType = appType;
  currentAppName = getCurrentAppName(context, sInstance, appType);
}
