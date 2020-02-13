// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainMenu _$MainMenuFromJson(Map<String, dynamic> json) {
  return MainMenu(
    topItems: (json['topItems'] as List)
        ?.map((e) =>
            e == null ? null : MainMenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    bottomItems: (json['bottomItems'] as List)
        ?.map((e) =>
            e == null ? null : MainMenuItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    currentItem: json['currentItem'] == null
        ? null
        : MainMenuItem.fromJson(json['currentItem'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MainMenuToJson(MainMenu instance) => <String, dynamic>{
      'topItems': instance.topItems?.map((e) => e?.toJson())?.toList(),
      'bottomItems': instance.bottomItems?.map((e) => e?.toJson())?.toList(),
      'currentItem': instance.currentItem?.toJson(),
    };
