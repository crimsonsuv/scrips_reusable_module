
class StringUtils {

  static bool isEmptyString(data) {
    if (data == null) return true;
    if (data is String) return data
        .trim()
        .isEmpty;
    return false;
  }
}
