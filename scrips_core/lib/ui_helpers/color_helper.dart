import 'package:flutter/material.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/utils.dart';

class ColorHelper {
  static Color getAppointmentLabelBgColor(String status) {
    switch(status){
      case appointmentStatusArrived:
        return enabledBtnBGColor;
      case appointmentStatusBooked:
        return disabledTabTextColor;
      case appointmentStatusCancelled:
        return red;
      case appointmentStatusCheckedIn:
        return lemonGreenColor;
      case appointmentStatusFulfilled:
        return successTabColor;
      case appointmentStatusNoShow:
        return red;
      case appointmentStatusEnteredInError:
        return red;
      case appointmentStatusPending:
        return disabledTabTextColor;
      case appointmentStatusProposed:
        return enabledBtnBGColor;
        case appointmentStatusWaitlist:
      return disabledTabTextColor;
      default:
        return enabledBtnBGColor;

    }
    // return (status?? "") ==
    //         appointmentStatusCancelled ||
    //         (status ?? "") ==
    //             appointmentStatusNoShow
    //         ? red
    //         : (status ?? "") ==
    //         appointmentStatusFulfilled ? lightGreen : enabledBtnBGColor;
  }

  static Color getSeverityColor(String status) {
    switch (status?.toLowerCase()) {
      case "level_4":
        return Color(0xffcf113c);
      case "level_3":
        return Color(0xffff4326);
      case "level_2":
        return Color(0xfff97d00);
      case "level_1":
        return Color(0xffffdc2c);
      case "info":
        return Color(0xff0a2f88);
      default:
        return Color(0xff808080);
    }
  }
}
