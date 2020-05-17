/*
  Utils for converting sizes based on original design
  Based on work of: zhuoyuan93@gmail.com
*/

import 'package:flutter/material.dart';

class Scr {
  static Scr instance = Scr();

  /// Size of the device screen as designed in some tool (Figma? InVision?) , px
  double width = 1024;
  double height = 768;

  /// Minimal size of the device screen as designed for these changes to take effect, px
  double minWidth = 0.0;
  double minHeight = 0.0;

  /// Maximal size of the device screen as designed for these changes to take effect, px
  double maxWidth = 0.0;
  double maxHeight = 0.0;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool allowFontScaling;

  static MediaQueryData _mediaQueryData;
  static double _screenWidth;
  static double _screenHeight;
  static double _pixelRatio;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  Scr({
    this.width = 1024,
    this.height = 768,
    this.allowFontScaling = false,
  });

  static Scr getInstance() {
    return instance;
  }


  static Scr of(BuildContext context) {
    _verifyMediaQuery(context);
    return instance;
  }

  static void _verifyMediaQuery(BuildContext context) {
    if (_mediaQueryData == null) {
      _mediaQueryData = MediaQuery.of(context);
      _pixelRatio = _mediaQueryData.devicePixelRatio;
      _screenWidth = _mediaQueryData.size.width;
      _screenHeight = _mediaQueryData.size.height;
      _statusBarHeight = _mediaQueryData.padding.top;
      _bottomBarHeight = _mediaQueryData.padding.bottom;
      _textScaleFactor = _mediaQueryData.textScaleFactor;
    }
  }

  void init(BuildContext context) {
    _verifyMediaQuery(context);
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactory => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double get screenWidthDp => _screenWidth;

  ///The vertical extent of this size. dp
  static double get screenHeightDp => _screenHeight;

  /// The vertical extent of this size. px
  static double get screenWidth => _screenWidth * _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenHeight => _screenHeight * _pixelRatio;

  /// The offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// The offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth / instance.width;
  double get scaleHeight => _screenHeight / instance.height;

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  num setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  num setHeight(num height) => height * scaleHeight;

  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  num setSp(num fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;
}