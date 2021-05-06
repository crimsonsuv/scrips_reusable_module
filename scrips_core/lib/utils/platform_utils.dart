import 'package:flutter/foundation.dart';

enum PlatformType { web, mobile }

bool isWebPlatform() => !isMobilePlatform();

bool isMobilePlatform() {
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
    case TargetPlatform.iOS:
      return true;
    default:
      return false;
  }
}
