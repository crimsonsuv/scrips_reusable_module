// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_sub_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainSubMenu _$MainSubMenuFromJson(Map<String, dynamic> json) {
  return MainSubMenu(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : MenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currentItem: json['currentItem'] == null
        ? null
        : MenuItem.fromJson(json['currentItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainSubMenuToJson(MainSubMenu instance) =>
    <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'currentItem': instance.currentItem?.toJson(),
    };
