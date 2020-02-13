import 'package:flutter/material.dart';

class Fonts {
  static String roboto = "Roboto";
}

class Images {
  Images._privateConstructor();

  static final Images _instance = Images._privateConstructor();

  static Images get instance {
    return _instance;
  }

  Image minus(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_minus.png"),
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
          image: AssetImage("assets/ic_cross.png"),
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
          image: AssetImage("assets/ic_plus.png"),
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
          image: AssetImage("assets/ic_back.png"),
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
          image: AssetImage("assets/ic_drop_down.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image dashboard(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/dashboard.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image clinic({
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
  }) =>
      Image(
        image: AssetImage('assets/clinic.png'),
        height: height,
        width: width,
        fit: fit,
        color: color,
        colorBlendMode: colorBlendMode,
      );

  Image messages(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/messages.png"),
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
          image: AssetImage("assets/notification.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image profile(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/user_icon.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
