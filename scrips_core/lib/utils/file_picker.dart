import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:path_provider/path_provider.dart';

class FileData{
  Uint8List fileBytes;
  String fileName;
  FileData({this.fileBytes, this.fileName});
}


class FilePickerUtils {
  static Future<FileData> pickFile() async {
    Uint8List fileBytes;
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['csv'], withData: true);

    if (result != null) {
      final bytes = (result.files.first.bytes);
      fileBytes = bytes;
    } else {
       fileBytes = null;
    }
    return FileData(fileBytes: fileBytes, fileName: result.files.first.name);
  }

  Future<String> createFileFromString(String baseString) async {
    final encodedStr = baseString;
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".csv");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  static void  downloadFile(String url) async {
    if (kIsWeb) {
       html.window.open(url, "csv");
      //html.window.location.assign(url);

    } else {
      Dio dio = Dio();
      try {
        var dir = await getApplicationDocumentsDirectory();
        print("path ${dir.path}");
        await dio.download(url, "${dir.path}/demo.csv",
            onReceiveProgress: (rec, total) {
          print("Rec: $rec , Total: $total");
        });
      } catch (e) {
        print(e);
      }

      print("Download completed");
    }
  }
}
