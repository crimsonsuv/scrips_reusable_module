class PropertyInfo<T> {
  T _value;
  String _validationError;
  //
  Function onValueSet;
  Function onValidationSet;
  //
  PropertyInfo(T value, {this.onValueSet}) {
    _value = value;
  }

  set value(T value) {
    this.value = value;
    if (onValueSet != null) {
      onValueSet(value);
    }
  }

  T get value {
    return _value;
  }

  set validationError(String validationError) {
    this.validationError = validationError;
    if (onValueSet != null) {
      onValueSet(validationError);
    }
  }

  String get validationError {
    return _validationError;
  }

  factory PropertyInfo.fromJson(Map<String, dynamic> json) {
    return PropertyInfo(json['value'] == null ? null : json['value'] as T);
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'value': _value?.toString()};

  @override
  String toString() {
    return _value?.toString();
//
  }
}
