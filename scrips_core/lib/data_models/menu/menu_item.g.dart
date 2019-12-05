// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
    id: json['id'] as String,
    iconName: json['iconName'] as String,
    label: json['label'] as String,
    enabled: json['enabled'] as bool,
    semanticLabel: json['semanticLabel'] as String,
    navigationRoute: json['navigationRoute'] as String,
  );
}

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) => <String, dynamic>{
      'id': instance.id,
      'iconName': instance.iconName,
      'label': instance.label,
      'semanticLabel': instance.semanticLabel,
      'enabled': instance.enabled,
      'navigationRoute': instance.navigationRoute,
    };
