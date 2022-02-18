// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationInformation _$AuthenticationInformationFromJson(
        Map<String, dynamic> json) =>
    AuthenticationInformation(
      token: json['token'] as String,
      expirationTime: DateTime.parse(json['expirationTime'] as String),
    );

Map<String, dynamic> _$AuthenticationInformationToJson(
        AuthenticationInformation instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expirationTime': instance.expirationTime.toIso8601String(),
    };
