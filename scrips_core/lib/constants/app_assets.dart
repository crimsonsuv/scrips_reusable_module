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
          image: AssetImage("assets/ic_branding.png"),
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
          image: AssetImage("assets/ic_organization.png"),
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

  Image bigSuccess(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/ic_big_success.png"),
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
          image: AssetImage("assets/ic_small_success.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
