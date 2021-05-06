
import 'package:flutter/cupertino.dart';

class TextHelper{

  static String getSeverityText(BuildContext context,String status) {
    switch(status?.toLowerCase()){
      case "level_4":
        return "Critical";
      case "level_3":
        return 'High';
      case "level_2":
        return 'Moderate';
      case "level_1":
        return 'Low';
      case "info":
        return 'Information';
      default:
        return 'Unknown';
    }
  }
}