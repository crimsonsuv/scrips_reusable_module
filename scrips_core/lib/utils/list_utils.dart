extension StringListConcatnation on List<String> {
  String concatenateWithComma() =>
      reduce((value, element) => value + ', ' + element);
}
