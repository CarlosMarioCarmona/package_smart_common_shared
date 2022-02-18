import 'package:json_annotation/json_annotation.dart';
part 'authentication_model.g.dart';

@JsonSerializable()
class AuthenticationInformation
{
  String token;
  DateTime expirationTime;
  AuthenticationInformation({required this.token, required this.expirationTime});

  factory AuthenticationInformation.fromJson(Map<String, dynamic> json) => _$AuthenticationInformationFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationInformationToJson(this);

}