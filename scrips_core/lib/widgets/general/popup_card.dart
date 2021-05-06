import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PopUpCard {
  double popupWidth ;
  double popupHeight ;
  OverlayEntry _entry;
  Offset _offset;
  Rect _showRect;

  VoidCallback dismissCallback;

  Size _screenSize;

  BuildContext context;

  bool _isVisible = false;

  PopUpCard(
    this.context, {
    this.popupWidth = 304.0,
    this.popupHeight = 464.0,
    VoidCallback onDismiss,
  }) {
    this.dismissCallback = onDismiss;
  }

  /// Shows a popup near a widget with key [widgetKey] or [rect].
  void show({Rect rect, GlobalKey widgetKey, @required Widget widget}) {
    if (rect == null && widgetKey == null) {
      print("both 'rect' and 'key' can't be null");
      return;
    }
    this._showRect = rect ?? _getWidgetGlobalRect(widgetKey);
    this._screenSize = window.physicalSize / window.devicePixelRatio;
    this.dismissCallback = dismissCallback;

    _calculatePosition(context);

    _entry = OverlayEntry(builder: (context) {
      return buildPopupLayout(_offset, widget);
    });

    Overlay.of(context).insert(_entry);
    _isVisible = true;
  }

  void _calculatePosition(BuildContext context) {
    _offset = _calculateOffset(context);
  }

  /// Returns globalRect of widget with key [key]
  Rect _getWidgetGlobalRect(GlobalKey key) {
    RenderBox renderBox = key.currentContext.findRenderObject();
    var offset = renderBox.localToGlobal(Offset.zero);
    return Rect.fromLTWH(offset.dx, offset.dy, renderBox.size.width, renderBox.size.height);
  }

  /// Returns calculated widget offset using [context]
  Offset _calculateOffset(BuildContext context) {
    double dx = _showRect.right;
    if (dx < 2.0) {
      dx = 2.0;
    }

    if (dx + popupWidth > _screenSize.width && dx > 2.0) {
      double tempDx = _screenSize.width - (popupWidth);
      if (tempDx > 2) dx = tempDx;
    }

    double dy = _showRect.bottom;
    if (dy < 2.0) {
      dy = 2.0;
    }

    if (dy + popupHeight > _screenSize.height && dy > 2.0) {
      double tempDy = _screenSize.height - popupHeight - 2;
      if (tempDy > 2) dy = tempDy;
    }
    return Offset(dx, dy);
  }

  /// Builds Layout of popup for specific [offset]
  LayoutBuilder buildPopupLayout(Offset offset, Widget widget) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          dismiss();
        },
        child: Material(
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              // triangle arrow
              // popup content
              Positioned(
                left: offset.dx,
                top: offset.dy,
                child: GestureDetector(behavior: HitTestBehavior.translucent, onTap: () {}, child: widget),
              )
            ],
          ),
        ),
      );
    });
  }

  /// Dismisses the popup
  void dismiss() {
    if (!_isVisible) {
      return;
    }
    _entry.remove();
    _isVisible = false;
    if (dismissCallback != null) {
      dismissCallback();
    }
  }
}
