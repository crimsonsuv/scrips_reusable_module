import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrips_core/ui_helpers/app_colors.dart';
import 'package:scrips_core/utils/platform_utils.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;

class ImagePickerUtils {
  static Future<Map<String, dynamic>> pickImage(
      {ImageSource source = ImageSource.gallery}) async {
    final Map<String, dynamic> data = {};

    //print("platform is ${Platform.}");

    if (!isMobilePlatform()) {
      final html.InputElement input = html.document.createElement('input');
      input
        ..type = 'file'
        ..accept = 'image/*';
      input.click();
      await input.onChange.first;
      if (input.files.isEmpty) return null;
      final reader = html.FileReader();
      reader.readAsDataUrl(input.files[0]);
      await reader.onLoad.first;
      final encoded = reader.result as String;
      final stripped =
          encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');
      final imageName = input.files?.first?.name;
      data.addAll({
        'name': imageName,
        'data': encoded,
      });
    } else {
      final pickedFile =
          await ImagePicker.pickImage(source: source, imageQuality: 30);

      String encoded = "";
      File croppedFile;
      if (pickedFile != null) {
        print("picked file ${pickedFile.path}");
        croppedFile = await ImageCropper.cropImage(
            compressQuality: 30,
            compressFormat: ImageCompressFormat.jpg,
            cropStyle: CropStyle.circle,
            aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
            sourcePath: pickedFile.path,
            iosUiSettings: IOSUiSettings(
              title: "Move and Scale",
              hidesNavigationBar: true,
            ),
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: "Move and Scale",
                toolbarColor: Colors.white,
                toolbarWidgetColor: textInputColor,
                cropGridColor: Colors.transparent,
                hideBottomControls: true,
                showCropGrid: false,
                cropFrameColor: enabledBtnBGColor));
        if (croppedFile != null) {
          final bytes = croppedFile.readAsBytesSync();
          encoded = "data:image/jpg;base64,${base64Encode(bytes)}";
          debugPrint("$encoded");
        } else {
          return null;
        }
      } else {
        return null;
      }

      data.addAll({
        'name': DateTime.now().toIso8601String(),
        'data': encoded,
        'file': croppedFile,
      });
    }

    return data;
  }

  static Future<Map<String, dynamic>> editImage({File file}) async {
    final Map<String, dynamic> data = {};

    //print("platform is ${Platform.}");

    print("picked file ${file.path}");
    String encoded = "";
    File croppedFile;
    if (file != null) {
      croppedFile = await ImageCropper.cropImage(
          compressQuality: 30,
          compressFormat: ImageCompressFormat.jpg,
          cropStyle: CropStyle.circle,
          aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
          sourcePath: file.path,
          iosUiSettings: IOSUiSettings(
            title: "Move and Scale",
            hidesNavigationBar: true,
          ),
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: "Move and Scale",
              toolbarColor: Colors.white,
              toolbarWidgetColor: textInputColor,
              cropGridColor: Colors.transparent,
              hideBottomControls: true,
              showCropGrid: false,
              cropFrameColor: enabledBtnBGColor));
      if (croppedFile != null) {
        final bytes = croppedFile.readAsBytesSync();
        encoded = "data:image/png;base64,${base64Encode(bytes)}";
      } else {
        return null;
      }
    }
    data.addAll({
      'name': DateTime.now().toIso8601String(),
      'data': encoded,
      'file': croppedFile,
    });

    return data;
  }
}
