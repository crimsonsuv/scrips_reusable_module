import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleChildScrollViewWithScrollbar extends StatelessWidget {
  const SingleChildScrollViewWithScrollbar({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.down,
    this.scrollbarColor,
    this.scrollbarThickness = 6.0,
  }) : super(key: key);

  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsets padding;
  final bool primary;
  final ScrollPhysics physics;
  final ScrollController controller;
  final Widget child;
  final DragStartBehavior dragStartBehavior;
  final Color scrollbarColor;
  final double scrollbarThickness;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: scrollDirection,
        reverse: reverse,
        padding: padding,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        child: Builder(
          builder: (BuildContext context) {
            return child;
          },
        ),
      ),
    );
  }
}

class SingleChildScrollViewWithAlwaysVisibleScrollbar extends StatefulWidget {
  const SingleChildScrollViewWithAlwaysVisibleScrollbar({
    Key key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.down,
    this.scrollbarColor,
    this.scrollbarThickness = 6.0,
  }) : super(key: key);

  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsets padding;
  final bool primary;
  final ScrollPhysics physics;
  final ScrollController controller;
  final Widget child;
  final DragStartBehavior dragStartBehavior;
  final Color scrollbarColor;
  final double scrollbarThickness;

  @override
  _SingleChildScrollViewWithAlwaysVisibleScrollbarState createState() =>
      _SingleChildScrollViewWithAlwaysVisibleScrollbarState();
}

class _SingleChildScrollViewWithAlwaysVisibleScrollbarState
    extends State<SingleChildScrollViewWithAlwaysVisibleScrollbar> {
  AlwaysVisibleScrollbarPainter _scrollbarPainter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    rebuildPainter();
  }

  @override
  void didUpdateWidget(
      SingleChildScrollViewWithAlwaysVisibleScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    rebuildPainter();
  }

  void rebuildPainter() {
    final theme = Theme.of(context);
    _scrollbarPainter = AlwaysVisibleScrollbarPainter(
      color: widget.scrollbarColor ?? theme.highlightColor.withOpacity(1.0),
      textDirection: Directionality.of(context),
      thickness: widget.scrollbarThickness,
    );
  }

  @override
  void dispose() {
    _scrollbarPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: _scrollbarPainter,
        child: RepaintBoundary(
          child: SingleChildScrollView(
            scrollDirection: widget.scrollDirection,
            reverse: widget.reverse,
            padding: widget.padding,
            primary: widget.primary,
            physics: widget.physics,
            controller: widget.controller,
            dragStartBehavior: widget.dragStartBehavior,
            child: Builder(
              builder: (BuildContext context) {
                //todo: @sumeet: donot Set _scrollbarPainter.scrollable if nothing to scroll
                ScrollableState scrollable = Scrollable.of(context);
                _scrollbarPainter.scrollable = scrollable;
                return widget.child;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysVisibleScrollbarPainter extends ScrollbarPainter {
  AlwaysVisibleScrollbarPainter({
    @required Color color,
    @required TextDirection textDirection,
    @required double thickness,
  }) : super(
          color: color,
          textDirection: textDirection,
          thickness: thickness,
          fadeoutOpacityAnimation: const AlwaysStoppedAnimation(1.0),
        );

  ScrollableState _scrollable;

  ScrollableState get scrollable => _scrollable;

  set scrollable(ScrollableState value) {
    _scrollable?.position?.removeListener(_onScrollChanged);
    _scrollable = value;
    _scrollable?.position?.addListener(_onScrollChanged);
    _onScrollChanged();
  }

  void _onScrollChanged() {
    update(_scrollable.position, _scrollable.axisDirection);
  }

  @override
  void dispose() {
    _scrollable?.position?.removeListener(notifyListeners);
    super.dispose();
  }
}
