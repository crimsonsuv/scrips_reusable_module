import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';

class Fonts {
  static String roboto = "Roboto";
  static String tajawal = "Tajawal";
}

class FilePaths {
  static String globalConfigFilePath =
      'assets/configuration/global_configuration.json';
}

class Images {
  Images._privateConstructor();

  static final Images _instance = Images._privateConstructor();

  static Images get instance {
    return _instance;
  }

  Image banner({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_branding.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image organization({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_organization.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image minus({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_minus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cross({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_cross.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image plusStepper({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_stepper_plus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image minusStepper({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_stepper_minus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image plus({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_plus.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallCheck({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_check.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image back({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_back.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dropDownIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_drop_down.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image bigSuccess({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_big_success.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallSuccess({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_success.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image listSortIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_list_sort.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallBack({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_back.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallForward({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_forward.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallBackGrey({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_back_grey.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallForwardGrey({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_forward_grey.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image listSortEnabled({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_list_sort_enabled.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image moreGreyIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_more_grey.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image edit({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_edit.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image searchIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_search.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image workTime({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_work_time.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image holidayTime({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_holiday_time.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image successSmall({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_success_small.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image notification({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_menu_notifications.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image getHelp({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_menu_get_help.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image appointmentIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_calendar.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image archiveIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_archive.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image breadCrumbNext({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_breadcrumb_next.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image minorIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_minor.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image starIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_star.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image starIconFilled({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_star_filled.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallPhone({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_phone.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallUser({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_user.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallHash({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_small_hash.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image userpic({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_userpic.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image licenseExpirationDate({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_calendar.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cameraIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_camera.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image location({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_location.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image appName({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_logo.png"),
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode);

  Image video({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_video.png"),
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dummyUser({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_user.png"),
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cardType({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_visa.png"),
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode);

  Image copy({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/ic_copy.png"),
          height: height,
          width: width,
          color: color,
          colorBlendMode: colorBlendMode);

  Image asset({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    String name,
    BoxFit fit}) =>
      Image(
          image: AssetImage(
              "submodules/scrips_msp1_flutter_shared/scrips_core/assets/$name.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  CircleAvatar circleAsset({
    Color color,
    double height,
    String name,
  }) =>
      CircleAvatar(
        backgroundColor: color,
        backgroundImage: AssetImage(
            "submodules/scrips_msp1_flutter_shared/scrips_core/assets/$name.png"),
        radius: height,
      );

  CircleAvatar addProfile({
    Color color,
    double height,
    String name,
  }) =>
      CircleAvatar(
        backgroundColor: color,
        child: Image.asset(
            "submodules/scrips_msp1_flutter_shared/scrips_core/assets/$name.png"),
        radius: height,
      );

  Widget deleteIcon({double size}) =>
      ScripsIcons.instance
          .icon(ScripsIcons.delete, size: size, color: redColor37);

  Image assetByName({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    String name,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/$name.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image logo({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_logo.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dashboard({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_dashboard.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image crossBig({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_cross_big.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image homeAppt({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_home_appt.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image virtualAppt({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_virtual_appt.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image officeApptSelected({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_office_appt_selected.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image backWhite({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_back_white.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image messages({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_menu_messages.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image workSmall({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_work.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image greenCheckMark({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_greenCheck.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dropDownIconWhite({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_drop_down_white.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallLocation({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_location.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image smallClock({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_small_clock.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image emailIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/email_icon.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image pmAppIcon({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/pm_app_icon.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image activeForm({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_active_form.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image inactiveForm({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_inactive_form.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image editBlue({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_edit_blue.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image sendPatient({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_send.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image cancelledSmall({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_cancelled.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image noshowSmall({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_noshow.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image waitingRoomSmall({double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_waitingroom.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  AssetImage assetsImage({String name}) =>
      AssetImage("submodules/scrips_msp1_flutter_shared/scrips_core/assets/$name.png");

}
