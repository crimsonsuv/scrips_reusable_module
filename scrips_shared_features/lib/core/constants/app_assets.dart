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

  Image pmAppIcon(
          {double width,
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

  Image scripsLogo(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/scrips_logo.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);

  Image success(
          {double width,
          double height,
          Color color,
          BlendMode colorBlendMode,
          BoxFit fit}) =>
      Image(
          image: AssetImage("assets/success.png"),
          height: height,
          width: width,
          fit: fit,
          color: color,
          colorBlendMode: colorBlendMode);
}
