// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      userName: json['userName'] as String,
      password: json['password'] as String,
      urlPhoto: json['urlPhoto'] as String,
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'userName': instance.userName,
      'password': instance.password,
      'urlPhoto': instance.urlPhoto,
      'lastLogin': instance.lastLogin.toIso8601String(),
      'roles': instance.roles,
    };
