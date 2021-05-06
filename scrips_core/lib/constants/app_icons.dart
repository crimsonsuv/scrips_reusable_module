import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_locale.dart';

class ScripsIcons {
  ScripsIcons._privateConstructor();

  static final ScripsIcons _instance = ScripsIcons._privateConstructor();

  static ScripsIcons get instance {
    return _instance;
  }

  static const int cancel = 0xe902;
  static const int noShow = 0xe918;
  static const int waitingRoom = 0xe919;
  static const int walkin = 0xe91a;
  static const int cancelled = 0xe91b;
  static const int forwardArrow = 0xe900;
  static const int block = 0xe901;
  static const int checkboxEmpty = 0xe904;
  static const int checkboxFilled = 0xe903;
  static const int comment = 0xe906;
  static const int delete = 0xe907;
  static const int edit = 0xe908;
  static const int externalSource = 0xe909;
  static const int home = 0xe90a;
  static const int list = 0xe90b;
  static const int location = 0xe90c;
  static const int minus = 0xe90d;
  static const int office = 0xe90e;
  static const int flag = 0xe90f;
  static const int plus = 0xe910;
  static const int recurring = 0xe911;
  static const int reminder = 0xe912;
  static const int resend = 0xe913;
  static const int grid = 0xe914;
  static const int vacation = 0xe915;
  static const int virtual = 0xe916;
  static const int work = 0xe917;
  static const int archive = 0xe92d;
  static const int check = 0xe92e;
  static const int arrowChevronUp = 0xe92f;
  static const int diagnosis = 0xe930;
  static const int hourglass = 0xe931;
  static const int idNumber = 0xe932;
  static const int preview = 0xe934;
  static const int sortArrow = 0xe935;
  static const int starFilled = 0xe936;
  static const int starEmpty = 0xe937;
  static const int unarchive = 0xe938;
  static const int lab = 0xe92c;
  static const int call = 0xe91e;
  static const int chat = 0xe91f;
  static const int clinical = 0xe920;
  static const int cross = 0xe921;
  static const int custom = 0xe922;
  static const int education = 0xe923;
  static const int help = 0xe924;
  static const int medication = 0xe925;
  static const int pencil = 0xe926;
  static const int procedure = 0xe927;
  static const int radiology = 0xe928;
  static const int referral = 0xe929;
  static const int search = 0xe92a;
  static const int voice = 0xe92b;
  static const int appointment = 0xe91c;
  static const int calendarToday = 0xe935;
  static const int keyboardArrowDown = 0xe313;
  static const int alert = 0xe959;
  static const int quit = 0xe958;
  static const int settings = 0xe95a;
  static const int addSolidCircular = 0xe956;
  static const int addCircular = 0xe955;
  static const int minusSolidCircular = 0xe957;
  static const int minusCircular = 0xe954;
  static const int arrowDown = 0xe94e;
  static const int arrowLeft = 0xe94f;
  static const int arrowRight = 0xe950;
  static const int arrowUp = 0xe951;
  static const int reviewed = 0xe952;
  static const int upload = 0xe953;
  static const int billing = 0xe94c;
  static const int eRx = 0xe94d;
  static const int more = 0xe94b;
  static const int action = 0xe94a;
  static const int arrowChevronLeft = 0xe948;
  static const int arrowChevronRight = 0xe949;
  static const int aP = 0xe944;
  static const int docs = 0xe945;
  static const int hPI = 0xe946;
  static const int rOS = 0xe947;
  static const int image = 0xe943;
  static const int pE = 0xe93c;
  static const int bloodPressure = 0xe93a;
  static const int bMI = 0xe93b;
  static const int heartRate = 0xe93d;
  static const int height = 0xe93e;
  static const int o2Sat = 0xe93f;
  static const int respRate = 0xe940;
  static const int vitals = 0xe941;
  static const int weight = 0xe942;
  static const int toggleActive = 0xe939;
  static const int toggleInactive = 0xe933;
  static const int add = 0xe91d;
  static const int chevronDown = 0xe905;
  static const int start_meds = 0xe95e;
  static const int stop_meds = 0xe95d;
  static const int refill_meds = 0xe95b;
  static const int change_meds = 0xe95c;
  static const int lock = 0xe962;
  static const int history = 0xe963;
  static const int expand = 0xe95f;
  static const int shrink = 0xe960;
  static const int refresh = 0xe961;
  static const int completed = 0xe964;
  static const int checked_in = 0xe965;
  static const int unmark_as_checked_in = 0xe966;
  static const int unmark_as_arrived = 0xe967;
  static const int drugInteraction = 0xe968;

  static const int intakeMissed = 0xe969;
  static const int intakeSkipped = 0xe96a;
  static const int intakeTake = 0xe96b;
  static const int intakeUnTake = 0xe96c;
  static const int healthProfile = 0xe96e;
  static const int manageAccount = 0xe96d;
  static const int paymentSettings = 0xe96f;
  static const int QRCode = 0xe970;
  static const int iconClock = 0xe977;
  static const int iconLanguage = 0xe978;
  static const int hcmVital = 0xe979;
  static const int lmpVital = 0xe97a;
  static const int iconFollowUp = 0xe97b;
  static const int iconFirstTime = 0xe97c;

  static const int iconSign = 0xe97e;
  static const int iconSave = 0xe97d;
  static const int iconFilter = 0xe97f;
  static const int duplicate = 0xe980;
  static const int iconSelfpay = 0xe982;
  static const int iconInsurance = 0xe981;
  static const int iconContract = 0xe983;

  Icon icon(int data, {double size, Color color}) {
    return Icon(
      IconData(data, fontFamily: "Scrips"),
      color: color,
      size: size,
    );
  }

  Widget translateIcon(int data, BuildContext context,
      {double size, Color color}) {
    final Locale appLocale = Localizations.localeOf(context);
    return Transform.rotate(
      angle: isDirectionRTL(context) == true ? 180 * math.pi / 180 : 0,
      child: Icon(
        IconData(data, fontFamily: "Scrips"),
        color: color,
        size: size,
      ),
    );
  }

  // creates mouse cursor effect on icon
  Widget iconInkWell(int data, {Function callback, double size, Color color}) {
    return InkWell(
      onTap: () {
        if (callback != null) callback();
      },
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Icon(
        IconData(data, fontFamily: "Scrips"),
        color: color,
        size: size,
      ),
    );
  }

  Widget translateIconInkWell(int data, BuildContext context,
      {Function callback, double size, Color color}) {
    return InkWell(
      onTap: () {
        if (callback != null) callback();
      },
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Transform.rotate(
        angle: isDirectionRTL(context) == true ? 180 * math.pi / 180 : 0,
        child: Icon(
          IconData(data, fontFamily: "Scrips"),
          color: color,
          size: size,
        ),
      ),
    );
  }
}
