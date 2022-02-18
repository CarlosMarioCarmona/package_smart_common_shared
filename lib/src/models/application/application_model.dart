import 'package:json_annotation/json_annotation.dart';
import 'package:smart_common_shared/src/models/menu/menu_model.dart';
part 'application_model.g.dart';
@JsonSerializable(explicitToJson: true)
class Application{
  String name;
  String homeRoute;
  List<GroupMenu> menu;
  Application({required this. name, required this.homeRoute, required this.menu});

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}