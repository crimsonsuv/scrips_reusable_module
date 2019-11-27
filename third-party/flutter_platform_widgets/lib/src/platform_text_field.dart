/*
 * flutter_platform_widgets
 * Copyright (c) 2018 Lance Johnstone. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:flutter/cupertino.dart' show CupertinoTextField, CupertinoColors, OverlayVisibilityMode;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' show InputDecoration, TextField, InputCounterWidgetBuilder;
import 'package:flutter/services.dart'
    show Brightness, TextInputFormatter, TextInputType, TextInputAction, TextCapitalization;
import 'package:flutter/widgets.dart';

import 'widget_base.dart';
import 'package:scrips_core/ui_helpers/text_styles.dart';

const TextStyle _kDefaultTextStyle = TextStyle(
  fontFamily: '.SF Pro Text',
  fontSize: 17.0,
  letterSpacing: -0.38,
  color: CupertinoColors.black,
  decoration: TextDecoration.none,
);
const BorderSide _kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoColors.lightBackgroundGray,
  style: BorderStyle.solid,
  width: 0.0,
);
const Border _kDefaultRoundedBorder = Border(
  top: _kDefaultRoundedBorderSide,
  bottom: _kDefaultRoundedBorderSide,
  left: _kDefaultRoundedBorderSide,
  right: _kDefaultRoundedBorderSide,
);
const BoxDecoration _kDefaultRoundedBorderDecoration = BoxDecoration(
  border: _kDefaultRoundedBorder,
  borderRadius: BorderRadius.all(Radius.circular(4.0)),
);

class MaterialTextFieldData {
  MaterialTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.textDirection,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.enableInteractiveSelection,
    this.onTap,
    this.buildCounter,
    this.dragStartBehavior,
    this.expands,
    this.minLines,
    this.scrollPhysics,
    this.strutStyle,
    this.scrollController,
    this.readOnly,
    this.showCursor,
    this.textAlignVertical,
    this.toolbarOptions,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final GestureTapCallback onTap;
  final InputCounterWidgetBuilder buildCounter;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final ScrollController scrollController;
  final bool readOnly;
  final bool showCursor;
  final TextAlignVertical textAlignVertical;
  final ToolbarOptions toolbarOptions;
}

class CupertinoTextFieldData {
  CupertinoTextFieldData({
    this.widgetKey,
    this.controller,
    this.focusNode,
    this.decoration,
    this.padding,
    this.placeholder,
    this.placeholderStyle,
    this.prefix,
    this.prefixMode,
    this.suffix,
    this.suffixMode,
    this.clearButtonMode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization,
    this.style,
    this.textAlign,
    this.autofocus,
    this.obscureText,
    this.autocorrect,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding,
    this.dragStartBehavior,
    this.expands,
    this.minLines,
    this.scrollPhysics,
    this.strutStyle,
    this.enableInteractiveSelection,
    this.scrollController,
    this.readOnly,
    this.showCursor,
    this.textAlignVertical,
    this.toolbarOptions,
    this.onTap,
  });

  final Key widgetKey;
  final TextEditingController controller;
  final FocusNode focusNode;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry padding;
  final String placeholder;
  final TextStyle placeholderStyle;
  final Widget prefix;
  final OverlayVisibilityMode prefixMode;
  final Widget suffix;
  final OverlayVisibilityMode suffixMode;
  final OverlayVisibilityMode clearButtonMode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final bool enableInteractiveSelection;
  final ScrollController scrollController;
  final bool readOnly;
  final bool showCursor;
  final TextAlignVertical textAlignVertical;
  final ToolbarOptions toolbarOptions;
  final GestureTapCallback onTap;
}

class PlatformTextField extends PlatformWidgetBase<CupertinoTextField, TextField> {
  final Key widgetKey;

  final PlatformBuilder<MaterialTextFieldData> android;
  final PlatformBuilder<CupertinoTextFieldData> ios;

  final TextEditingController controller;
  final FocusNode focusNode;

  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  final TextStyle style;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;

  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final DragStartBehavior dragStartBehavior;
  final bool expands;
  final int minLines;
  final ScrollPhysics scrollPhysics;
  final StrutStyle strutStyle;
  final bool enableInteractiveSelection;
  final ScrollController scrollController;
  final GestureTapCallback onTap;
  final bool readOnly;
  final bool showCursor;
  final TextAlignVertical textAlignVertical;
  final ToolbarOptions toolbarOptions;

  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;

  /// A lighter colored placeholder hint that appears on the first line of the
  /// text field when the text entry is empty.
  ///
  /// Defaults to having no placeholder text.
  ///
  /// The text style of the placeholder text matches that of the text field's
  /// main text entry except a lighter font weight and a grey font color.
  final String placeholder;

  /// The style to use for the placeholder text.
  ///
  /// The [placeholderStyle] is merged with the [style] [TextStyle] when applied
  /// to the [placeholder] text. To avoid merging with [style], specify
  /// [TextStyle.inherit] as false.
  ///
  /// Defaults to the [style] property with w300 font weight and grey color.
  ///
  /// If specifically set to null, placeholder's style will be the same as [style].
  final TextStyle placeholderStyle;

  PlatformTextField(
      {Key key,
      this.widgetKey,
      this.controller,
      this.focusNode,
      TextInputType keyboardType,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.style,
      this.textAlign = TextAlign.start,
      this.autofocus = false,
      this.obscureText = false,
      this.autocorrect = true,
      this.maxLines = 1,
      this.maxLength,
      this.maxLengthEnforced = true,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth = 2.0,
      this.cursorRadius,
      this.cursorColor,
      this.keyboardAppearance,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.dragStartBehavior,
      this.minLines,
      this.expands,
      this.scrollPhysics,
      this.strutStyle,
      this.enableInteractiveSelection = true,
      this.scrollController,
      this.onTap,
      this.readOnly,
      this.showCursor,
      this.textAlignVertical,
      this.toolbarOptions,
      this.android,
      this.ios,
      this.placeholder,
      this.placeholderStyle})
      : keyboardType = keyboardType ?? (maxLines == 1 ? TextInputType.text : TextInputType.multiline),
        super(key: key);

  @override
  TextField createAndroidWidget(BuildContext context) {
    MaterialTextFieldData data;
    if (android != null) {
      data = android(context);
    }

    //sumeet: create inputDecoratiopn for Android
    InputDecoration decoration;
    if (this.placeholder != null && this.placeholder != '') {
      decoration = InputDecoration.collapsed(
        hintText: this.placeholder,
        hintStyle: this.placeholderStyle ?? defaultHintStyle(null, null),
      );
    }

    return TextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style ?? _kDefaultTextStyle,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      //sumeet
      decoration: decoration ?? data?.decoration ?? _kDefaultRoundedBorderDecoration,
      // sumeet END
      textDirection: data?.textDirection,
      buildCounter: data?.buildCounter,
      dragStartBehavior: data?.dragStartBehavior ?? dragStartBehavior ?? DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection ?? enableInteractiveSelection,
      scrollController: data?.scrollController ?? scrollController,
      onTap: data?.onTap ?? onTap,
      readOnly: data?.readOnly ?? readOnly ?? false,
      showCursor: data?.showCursor ?? showCursor,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      toolbarOptions: data?.toolbarOptions ?? toolbarOptions,
    );
  }

  @override
  CupertinoTextField createIosWidget(BuildContext context) {
    CupertinoTextFieldData data;
    if (ios != null) {
      data = ios(context);
    }

    return CupertinoTextField(
      key: data?.widgetKey ?? widgetKey,
      autocorrect: data?.autocorrect ?? autocorrect,
      autofocus: data?.autofocus ?? autofocus,
      controller: data?.controller ?? controller,
      cursorColor: data?.cursorColor ?? cursorColor ?? CupertinoColors.activeBlue,
      cursorRadius: data?.cursorRadius ?? cursorRadius,
      cursorWidth: data?.cursorWidth ?? cursorWidth,
      enabled: data?.enabled ?? enabled,
      focusNode: data?.focusNode ?? focusNode,
      inputFormatters: data?.inputFormatters ?? inputFormatters,
      keyboardAppearance: data?.keyboardAppearance ?? keyboardAppearance,
      keyboardType: data?.keyboardType ?? keyboardType,
      maxLength: data?.maxLength ?? maxLength,
      maxLengthEnforced: data?.maxLengthEnforced ?? maxLengthEnforced,
      maxLines: data?.maxLines ?? maxLines,
      obscureText: data?.obscureText ?? obscureText,
      onChanged: data?.onChanged ?? onChanged,
      onEditingComplete: data?.onEditingComplete ?? onEditingComplete,
      onSubmitted: data?.onSubmitted ?? onSubmitted,
      scrollPadding: data?.scrollPadding ?? scrollPadding,
      style: data?.style ?? style ?? _kDefaultTextStyle,
      textAlign: data?.textAlign ?? textAlign,
      textCapitalization: data?.textCapitalization ?? textCapitalization,
      textInputAction: data?.textInputAction ?? textInputAction,
      clearButtonMode: data?.clearButtonMode ?? OverlayVisibilityMode.never,
      padding: data?.padding ?? const EdgeInsets.all(6.0),
      placeholder: this.placeholder ?? data?.placeholder,
      placeholderStyle: this.placeholderStyle ?? data?.placeholderStyle,
      prefix: data?.prefix,
      prefixMode: data?.prefixMode ?? OverlayVisibilityMode.always,
      suffix: data?.suffix,
      suffixMode: data?.suffixMode ?? OverlayVisibilityMode.always,
      dragStartBehavior: data?.dragStartBehavior ?? dragStartBehavior ?? DragStartBehavior.start,
      expands: data?.expands ?? expands ?? false,
      minLines: data?.minLines ?? minLines,
      scrollPhysics: data?.scrollPhysics ?? scrollPhysics,
      strutStyle: data?.strutStyle ?? strutStyle,
      enableInteractiveSelection: data?.enableInteractiveSelection ?? enableInteractiveSelection,
      scrollController: data?.scrollController ?? scrollController,
      onTap: data?.onTap ?? onTap,
      readOnly: data?.readOnly ?? readOnly ?? false,
      showCursor: data?.showCursor ?? showCursor,
      textAlignVertical: data?.textAlignVertical ?? textAlignVertical,
      toolbarOptions: data?.toolbarOptions ?? toolbarOptions,
    );
  }
}
