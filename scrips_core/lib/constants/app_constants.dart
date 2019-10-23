import 'package:flutter/material.dart';
import 'package:scrips_core/datamodels/locale/supported_locale.dart';

const PM_APP_NAME = 'Scrips Practice Management';
const PM_APP_PRIMARY_SWATCH = Colors.blue;
const PM_APP_INITIAL_ROUTE = Colors.blue;
const PM_DEFAULT_LOCALE_CODE = 'en';
const PM_DEFAULT_LOCALE_COUNTRY = '';

final List<SupportedLocale> supportedLocales = [
  SupportedLocale(label: 'English', localeCode: 'en', localeCountry: ''),
  SupportedLocale(label: 'Arabic', localeCode: 'ar', localeCountry: ''),
];
