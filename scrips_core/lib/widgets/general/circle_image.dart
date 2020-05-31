import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';

class CircleImage extends StatelessWidget {
  final image;
  final size;

  const CircleImage({Key key, this.image, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size ?? 40,
        height: size ?? 40,
        child: ClipRRect(borderRadius: BorderRadius.circular(40),child: Images.instance.userpic()),);
  }
}
