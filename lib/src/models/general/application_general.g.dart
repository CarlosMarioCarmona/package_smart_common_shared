// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_general.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationGeneral _$ApplicationGeneralFromJson(Map<String, dynamic> json) =>
    ApplicationGeneral(
      authenticationsInformation: AuthenticationInformation.fromJson(
          json['authenticationsInformation'] as Map<String, dynamic>),
      applications: (json['applications'] as List<dynamic>)
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApplicationGeneralToJson(ApplicationGeneral instance) =>
    <String, dynamic>{
      'authenticationsInformation':
          instance.authenticationsInformation.toJson(),
      'applications': instance.applications.map((e) => e.toJson()).toList(),
      'user': instance.user.toJson(),
    };
