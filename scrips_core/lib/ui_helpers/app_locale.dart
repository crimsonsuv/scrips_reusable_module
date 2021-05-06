import 'package:flutter/material.dart';

bool isDirectionRTL(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

