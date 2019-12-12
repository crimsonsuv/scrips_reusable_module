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

Map<String, dynamic> mockDataOrganizations = {
  "organizations": [
    {
      "organizationId": "ID33551",
      "name": "Igggg",
      "dateOfSignUp": "2019-12-08T20:45:38.9947939+00:00",
      "numberOfUsers": 9,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9947973+00:00",
      "isActive": false
    },
    {
      "organizationId": "ID15645",
      "name": "Igoror",
      "dateOfSignUp": "2019-12-08T20:45:38.9948861+00:00",
      "numberOfUsers": 3,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9948878+00:00",
      "isActive": false
    },
    {
      "organizationId": "ID68159",
      "name": "Igoro",
      "dateOfSignUp": "2019-12-08T20:45:38.9948968+00:00",
      "numberOfUsers": 5,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9948984+00:00",
      "isActive": false
    },
    {
      "organizationId": "ID14915",
      "name": "Popeye",
      "dateOfSignUp": "2019-12-08T20:45:38.9949068+00:00",
      "numberOfUsers": 8,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949084+00:00",
      "isActive": false
    },
    {
      "organizationId": "MyOrg24",
      "name": "JEBEL ALI  IKAD",
      "dateOfSignUp": "2019-12-08T20:45:38.9949167+00:00",
      "numberOfUsers": 3,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949183+00:00",
      "isActive": false
    },
    {
      "organizationId": "MyOrg24",
      "name": "JEBEL ALI  IKAD",
      "dateOfSignUp": "2019-12-08T20:45:38.9949268+00:00",
      "numberOfUsers": 1,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949283+00:00",
      "isActive": false
    },
    {
      "organizationId": "MyOrg23",
      "name": "JEBEL ALI  IKAD",
      "dateOfSignUp": "2019-12-08T20:45:38.9949368+00:00",
      "numberOfUsers": 6,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949384+00:00",
      "isActive": false
    },
    {
      "organizationId": "7befb0df-0e-444f-a0db-40ddca3834e8",
      "name": "JEBEL ALI  IKAD",
      "dateOfSignUp": "2019-12-08T20:45:38.9949466+00:00",
      "numberOfUsers": 5,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949482+00:00",
      "isActive": true
    },
    {
      "organizationId": "test123",
      "name": "amiran test organization",
      "dateOfSignUp": "2019-12-08T20:45:38.9949566+00:00",
      "numberOfUsers": 4,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949581+00:00",
      "isActive": true
    },
    {
      "organizationId": null,
      "name": "ABUMOOSA ALASHARI PRIVATE SCHOOL CLINIC",
      "dateOfSignUp": "2019-12-08T20:45:38.9949666+00:00",
      "numberOfUsers": 7,
      "mobileNumber": null,
      "lastSignIn": "2019-12-10T20:45:38.9949681+00:00",
      "isActive": true
    }
  ]
};
