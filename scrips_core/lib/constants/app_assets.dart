import 'package:flutter/material.dart';

class Fonts {
  static String roboto = "Roboto";
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

  Image banner(
          {double width,
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

  Image organization(
          {double width,
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

  Image minus(
          {double width,
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

  Image cross(
          {double width,
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

  Image plusStepper(
          {double width,
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

  Image minusStepper(
          {double width,
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

  Image plus(
          {double width,
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

  Image back(
          {double width,
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

  Image dropDownIcon(
          {double width,
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

  Image bigSuccess(
          {double width,
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

  Image smallSuccess(
          {double width,
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

  Image listSortIcon(
          {double width,
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

  Image smallBack(
          {double width,
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

  Image smallForward(
          {double width,
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

  Image smallBackGrey(
          {double width,
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

  Image smallForwardGrey(
          {double width,
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

  Image listSortEnabled(
          {double width,
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
  Image moreGreyIcon(
          {double width,
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

  Image edit(
          {double width,
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

  Image searchIcon(
          {double width,
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

  Image workTime(
          {double width,
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

  Image holidayTime(
          {double width,
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

  Image successSmall(
          {double width,
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

  Image notification(
          {double width,
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

  Image getHelp(
          {double width,
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

  Image appointmentIcon(
          {double width,
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

  Image archiveIcon(
          {double width,
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

  Image breadCrumbNext(
          {double width,
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

  Image minorIcon(
          {double width,
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

  Image starIcon(
          {double width,
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

  Image starIconFilled(
          {double width,
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

  Image smallPhone(
          {double width,
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

  Image smallUser(
          {double width,
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

  Image smallHash(
          {double width,
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

  Image userpic(
          {double width,
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

  Image licenseExpirationDate(
          {double width,
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

  Image cameraIcon(
          {double width,
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

  Image location(
          {double width,
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
}
