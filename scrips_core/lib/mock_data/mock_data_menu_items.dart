import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_routes.dart';

//
Map<String, dynamic> mockDataMenuItems = {
  'items': [
    {
      'id': RoutePaths.Home,
      'label': 'Home',
      'enabled': true,
      'semanticLabel': '',
      'iconName': 'home',
      'navigationRoute': RoutePaths.Home,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.Home1,
            'label': 'Home - Home',
            'iconName': 'home',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.Home1,
          },
        ],
        'currentItem': null,
      }
    },
    {
      'id': RoutePaths.PracticeOnBoardingWizard,
      'label': 'OnBoarding',
      'iconName': 'directions_railway',
      'enabled': true,
      'semanticLabel': '',
      'navigationRoute': RoutePaths.PracticeOnBoardingWizard,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.PracticeOnBoardingWizard1,
            'label': 'OnBoarding - 1',
            'iconName': 'directions_transit',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizard1,
          },
          {
            'id': RoutePaths.PracticeOnBoardingWizard2,
            'label': 'OnBoarding - 2',
            'iconName': 'directions_boat',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizard2,
          },
        ],
        'currentItem': null,
      }
    },
    {
      'id': RoutePaths.Settings,
      'label': 'Settings',
      'iconName': 'settings',
      'enabled': true,
      'semanticLabel': '',
      'navigationRoute': RoutePaths.Settings,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.Settings1,
            'label': 'Settings - 1',
            'iconName': 'settings_applications',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizard1,
          },
          {
            'id': RoutePaths.Settings2,
            'label': 'Settings - 2',
            'iconName': 'settings_backup_restore',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.Settings2,
          },
        ],
        'currentItem': null,
      }
    },
  ],
  'currentItem': null,
};
