import 'package:json_annotation/json_annotation.dart';
import 'package:smart_common_shared/src/models/application/application_model.dart';
import 'package:smart_common_shared/src/models/security/authentication_model.dart';
import 'package:smart_common_shared/src/models/user/user_model.dart';
part 'application_general.g.dart';

@JsonSerializable(explicitToJson: true)
class ApplicationGeneral{
  AuthenticationInformation authenticationsInformation;
  List<Application> applications;
  User user;
  ApplicationGeneral({required this.authenticationsInformation, required this.applications, required this.user});

  factory ApplicationGeneral.fromJson(Map<String, dynamic> json) => _$ApplicationGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationGeneralToJson(this);

}