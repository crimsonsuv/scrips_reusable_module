class PropertyInfo<T> {
  T _value;
  Function onSet;

  PropertyInfo(T value, {this.onSet})
  {
    _value = value;
  }

  set value(T value) {
    this.value = value;
    if (onSet != null) {
      onSet(value);
    }
  }
  T get value
  {
    return _value;
  }

  factory PropertyInfo.fromJson(Map<String, dynamic> json) {
    return PropertyInfo(json['value'] == null ? null : json['value'] as T);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'value': _value?.toString()};

  @override
  String toString() {
    return _value?.toString();
//
  }
}
