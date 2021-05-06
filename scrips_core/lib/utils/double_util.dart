extension DisplayDouble on double {
  String displayForm({int minDecimal = 0, maxDecimal = 2}) {
    if (this % 1 == 0) return this.round().toString();
    if ((this * 10) % 1 == 0) return this.toStringAsFixed(1);
    return this.toStringAsFixed(maxDecimal);
  }
}
