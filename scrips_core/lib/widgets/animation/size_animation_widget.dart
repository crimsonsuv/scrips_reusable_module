import 'package:flutter/material.dart';

class SizeAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool expand;
  final Duration duration;
  final Axis axis;

  SizeAnimationWidget(
      {this.expand = false,
      this.child,
      this.duration = const Duration(milliseconds: 500),
      this.axis = Axis.vertical,
      Key key})
      : super(key: key);

  @override
  _SizeAnimationWidgetState createState() => _SizeAnimationWidgetState();
}

class _SizeAnimationWidgetState extends State<SizeAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
    _runExpandCheck();
  }

  ///Setting up the animation
  void prepareAnimations() {
    expandController =
        AnimationController(vsync: this, duration: widget.duration);
    animation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
  }

  void _runExpandCheck() {
    if (widget.expand) {
      expandController.forward();
    } else {
      expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(SizeAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        axis: widget.axis,
        axisAlignment: 1.0,
        sizeFactor: animation,
        child: widget.child);
  }
}
