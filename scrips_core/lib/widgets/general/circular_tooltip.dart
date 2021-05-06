import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularTooltip extends StatelessWidget {
  final String message;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  const CircularTooltip({Key key, this.message, this.child, this.padding , this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      padding: padding,
      margin: margin,
      preferBelow: true,
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(32), color: Colors.black),
      child: child,
    );
  }
}
