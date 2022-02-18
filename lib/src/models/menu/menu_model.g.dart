// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupMenu _$GroupMenuFromJson(Map<String, dynamic> json) => GroupMenu(
      name: json['name'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => MenuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GroupMenuToJson(GroupMenu instance) => <String, dynamic>{
      'name': instance.name,
      'items': instance.items,
    };
