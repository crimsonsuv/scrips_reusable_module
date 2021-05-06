import 'package:flutter/material.dart';
import 'package:scrips_core/constants/app_icons.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/ui_helpers/app_sizes.dart';
import 'package:scrips_core/utils/image_utils.dart';
import 'package:scrips_core/widgets/general/circle_image.dart';

import 'button_helper.dart';

Widget avatar(String image, {double size = defaultAvatarSize}) =>
    CircleImage(
      size: size,
      image: image,
    );

Widget roundedCornerImage(ImageProvider image,
        {double height = 88, double width = 88, double radius = 13}) =>
    Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              onError: (e, s) {
                print(e);
                print(s);
              },
              image: image ??
                  NetworkImage('https://via.placeholder.com/${width}x$height')),
          borderRadius: BorderRadius.all(Radius.circular(radius)),
        ));

Widget imageWithCloseIcon(String path, {bool showClose = false, callback}) {
  ImageProvider imageProvider = ImageUtils.toImageProvider(path);

  return Container(
    width: 88,
    child: Stack(
      children: [
        roundedCornerImage(imageProvider),
        if (showClose)
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: scripsCircularIconButton(ScripsIcons.cross,
                  background: Colors.black26,
                  color: Colors.white,
                  size: 14,
                  callback: callback),
            ),
          )
      ],
    ),
  );
}
