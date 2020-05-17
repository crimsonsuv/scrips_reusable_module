import 'package:flutter/material.dart';

class SupportedLocale {
  final String label;
  final String semanticLabel;
  final String localeCode;
  final String localeCountry;
  final IconData icon;

  SupportedLocale({this.label, this.icon, this.semanticLabel, this.localeCode, this.localeCountry});
}
