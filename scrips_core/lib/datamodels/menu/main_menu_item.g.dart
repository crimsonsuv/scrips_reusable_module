// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainMenuItem _$MainMenuItemFromJson(Map<String, dynamic> json) {
  return MainMenuItem(
    id: json['id'] as String,
    iconName: json['iconName'] as String,
    label: json['label'] as String,
    enabled: json['enabled'] as bool,
    semanticLabel: json['semanticLabel'] as String,
    navigationRoute: json['navigationRoute'] as String,
    subMenu: json['subMenu'] == null
        ? null
        : MainSubMenu.fromJson(json['subMenu'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainMenuItemToJson(MainMenuItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iconName': instance.iconName,
      'label': instance.label,
      'semanticLabel': instance.semanticLabel,
      'enabled': instance.enabled,
      'navigationRoute': instance.navigationRoute,
      'subMenu': instance.subMenu?.toJson(),
    };
