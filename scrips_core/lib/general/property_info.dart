import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class PropertyInfo<T>
{
  T value;
  Function onSet;

  PropertyInfo(this.value, {this.onSet});

  setValue(T value)
  {
    this.value = value;
    if (onSet != null) {
      onSet(value);
    }
  }

  factory PropertyInfo.fromJson(Map<String, dynamic> json)  {
  return PropertyInfo(
      json['value'] == null   ? null : json['value'] as T  );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'value': this.value?.toString()
  };

  @override
  String toString ( ) {
    return this.value?.toString();
  }
}
