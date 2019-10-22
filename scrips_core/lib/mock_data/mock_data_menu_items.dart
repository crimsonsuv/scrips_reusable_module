import 'package:scrips_core/constants/app_routes.dart';

//
Map<String, dynamic> mockDataMenuItems = {
  'items': [
    {
      'id': RoutePaths.Home,
      'label': 'Home',
      'enabled': true,
      'semanticLabel': '',
      'navigationRoute': RoutePaths.Home,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.Home1,
            'label': 'Home - Home',
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
      'enabled': true,
      'semanticLabel': '',
      'navigationRoute': RoutePaths.PracticeOnBoardingWizard,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.PracticeOnBoardingWizard1,
            'label': 'OnBoarding - 1',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizard1,
          },
          {
            'id': RoutePaths.PracticeOnBoardingWizard2,
            'label': 'OnBoarding - 2',
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
      'enabled': true,
      'semanticLabel': '',
      'navigationRoute': RoutePaths.Settings,
      'subMenu': {
        'items': [
          {
            'id': RoutePaths.Settings1,
            'label': 'Settings - 1',
            'enabled': true,
            'semanticLabel': '',
            'navigationRoute': RoutePaths.PracticeOnBoardingWizard1,
          },
          {
            'id': RoutePaths.Settings2,
            'label': 'Settings - 2',
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
