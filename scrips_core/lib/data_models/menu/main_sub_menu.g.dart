// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_sub_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainSubMenu _$MainSubMenuFromJson(Map<String, dynamic> json) {
  return MainSubMenu(
    topItems: (json['topItems'] as List)
        ?.map((e) =>
            e == null ? null : MenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bottomItems: (json['bottomItems'] as List)
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
      'topItems': instance.topItems?.map((e) => e?.toJson())?.toList(),
      'bottomItems': instance.bottomItems?.map((e) => e?.toJson())?.toList(),
      'currentItem': instance.currentItem?.toJson(),
    };
