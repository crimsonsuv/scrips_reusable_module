/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'platform.dart' show isMaterial;

String formatData(
    BuildContext context, String data, TextCapitalization textCapitalization) {
  if (/*isMaterial(context) &&*/ textCapitalization ==
      TextCapitalization.characters) {
    return data?.toUpperCase();
  }
  return data;
}

typedef Text _TextBuilder(BuildContext context);

class PlatformText extends StatelessWidget {
  final _TextBuilder _textBuilder;

  PlatformText._(Key key, this._textBuilder) : super(key: key);

  factory PlatformText(
    String data, {
    Key key,
    TextStyle style,
    TextAlign textAlign,
    TextDirection textDirection,
    bool softWrap,
    TextOverflow overflow,
    double textScaleFactor,
    int maxLines,
    Locale locale,
    String semanticsLabel,
    StrutStyle strutStyle,
    TextWidthBasis textWidthBasis,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return PlatformText._(
        key,
        (BuildContext context) => Text(
              formatData(context, data, textCapitalization),
              key: key,
              style: style,
              textAlign: textAlign,
              textDirection: textDirection,
              softWrap: softWrap,
              overflow: overflow,
              textScaleFactor: textScaleFactor,
              maxLines: maxLines,
              locale: locale,
              semanticsLabel: semanticsLabel,
              strutStyle: strutStyle,
              textWidthBasis: textWidthBasis,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return _textBuilder(context);
  }
}
