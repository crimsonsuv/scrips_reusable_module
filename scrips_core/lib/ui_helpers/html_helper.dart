import 'package:html/parser.dart';

class HtmlHelper {
//here goes the function
  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }
}
