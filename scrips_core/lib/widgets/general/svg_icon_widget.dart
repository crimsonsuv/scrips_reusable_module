//import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//
//class SVGWidget extends StatelessWidget {
//  SVGWidget({Key key, this.size, this.assetName, this.color}) : super(key: key);
//  final double size;
//  final String assetName;
//  final Color color;
//
//  @override
//  Widget build(BuildContext context) {
//    return SizedBox(
//      height: this.size,
//      width: this.size,
//      child: (color != null)
//          ? SvgPicture.asset(
//              this.assetName,
//              color: this.color,
//            )
//          : SvgPicture.asset(
//              this.assetName,
//            ),
//    );
//  }
//}
