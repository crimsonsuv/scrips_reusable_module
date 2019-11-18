import 'package:scrips_core/constants/app_routes.dart';

//
Map<String, dynamic> mockDataMenuItems = {
  'items': [
    {
      'id': RoutePaths.Home,
      'label': 'Home',
      'enabled': true,
      'semanticLabel': '',
      'iconName': 'dashboard',
      'navigationRoute': RoutePaths.Home,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.HomeSubMenu1,
            'label': 'Home - Home',
            'iconName': 'home',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.HomeSubMenu1,
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
            'id': RoutePaths.PracticeOnBoardingWizardSubMenu1,
            'label': 'OnBoarding - 1',
            'iconName': 'directions_transit',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizardSubMenu1,
          },
          {
            'id': RoutePaths.PracticeOnBoardingWizardSubMenu2,
            'label': 'OnBoarding - 2',
            'iconName': 'directions_boat',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizardSubMenu2,
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
            'id': RoutePaths.SettingsSubMenu1,
            'label': 'Settings - 1',
            'iconName': 'settings_applications',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizardSubMenu1,
          },
          {
            'id': RoutePaths.SettingsSubMenu2,
            'label': 'Settings - 2',
            'iconName': 'settings_backup_restore',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.SettingsSubMenu2,
          },
        ],
        'currentItem': null,
      }
    },
  ],
  'currentItem': null,
};
