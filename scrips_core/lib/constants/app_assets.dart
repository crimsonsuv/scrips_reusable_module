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

  Image back(double width, double height, Color color, BlendMode colorBlendMode,
          BoxFit fit) =>
      Image(
          image: AssetImage("assets/back.png"),
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
          image: AssetImage("assets/drop_down_icon.png"),
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
}
