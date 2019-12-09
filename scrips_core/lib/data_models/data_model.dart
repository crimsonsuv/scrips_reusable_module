class DataModel {
  static DateTime parseDate(String stringDate) {
    // match seconds (:23) followed by . or , with 7 or more digits
    // e.g. is string '2019-12-05T22:04:02.6282341+00:00' it will match ':02.6282341'
    RegExp rx = RegExp(r':\d{2}[.,]\d{7,}');
    if (rx.hasMatch(stringDate)) {
      String str = rx.stringMatch(stringDate);
      stringDate = stringDate.replaceAll(str, str.substring(0, 10)); // cut off decimals over microsecond
    }
    return DateTime.parse(stringDate);
  }
}
