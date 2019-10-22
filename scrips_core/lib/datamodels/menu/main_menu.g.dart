// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainMenu _$MainMenuFromJson(Map<String, dynamic> json) {
  return MainMenu(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : MainMenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currentItem: json['currentItem'] == null
        ? null
        : MainMenuItem.fromJson(json['currentItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainMenuToJson(MainMenu instance) => <String, dynamic>{
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
      'currentItem': instance.currentItem?.toJson(),
    };
