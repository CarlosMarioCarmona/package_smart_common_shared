// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) => Application(
      name: json['name'] as String,
      homeRoute: json['homeRoute'] as String,
      menu: (json['menu'] as List<dynamic>)
          .map((e) => GroupMenu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'name': instance.name,
      'homeRoute': instance.homeRoute,
      'menu': instance.menu.map((e) => e.toJson()).toList(),
    };
