import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

class ImageUtils {
  static ImageProvider toImageProvider(String data) {
    if (data != null && data.toLowerCase().startsWith("http")) {
      return NetworkImage(data);
    }
    //TODO: File detection this check need to better
    else if (data.startsWith("/")) {
      return FileImage(File(data));
    } else {
      final imageData = base64.decode(data);
      return MemoryImage(imageData);
    }
  }
}
