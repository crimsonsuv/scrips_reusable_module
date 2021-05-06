import 'package:flutter/material.dart';

class DottedLineWidget extends StatelessWidget {
  const DottedLineWidget(
      {Key key,
      this.direction = Axis.horizontal,
      this.dashColor = Colors.black,
      this.dashGap = 2,
      this.dashLength = 1,
      this.dashThickness = 1,
      this.dashBorderRadius = 1})
      : super(key: key);

  final Axis direction;
  final Color dashColor;
  final double dashGap;
  final double dashLength;
  final double dashThickness;
  final double dashBorderRadius;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = direction == Axis.horizontal ?constraints.constrainWidth() :constraints.constrainHeight();
        final int dashCount = (boxWidth + dashGap) ~/ (dashGap + dashLength);
        return Flex(
          children: List.generate(dashCount, (index) {
            return step(index);
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
        );
      },
    );
  }

  Widget step(int index) {
    bool isHorizontal = direction == Axis.horizontal;
    return SizedBox(
      width: isHorizontal ? dashLength : dashThickness,
      height: isHorizontal ? dashThickness : dashLength,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: dashColor,
            borderRadius: BorderRadius.all(Radius.circular(dashBorderRadius))),
      ),
    );
  }
}
