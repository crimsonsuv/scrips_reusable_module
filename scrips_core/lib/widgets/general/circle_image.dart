import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_assets.dart';
import 'package:scrips_core/utils/utils.dart';

class CircleImage extends StatelessWidget {
  final String image;
  final double size;
  final Image fallbackImage;

  const CircleImage({Key key, this.image, this.size, this.fallbackImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Container(
        height: size,
        width: size,
        child: !isBlank(image)
            ? Image.network(
                image,
                fit: BoxFit.cover,
                height: size,
                width: size,
              )
            : (fallbackImage == null
                ? Images.instance
                    .userpic(height: size, width: size, fit: BoxFit.cover)
                : fallbackImage),
      ),
    );
  }
}
